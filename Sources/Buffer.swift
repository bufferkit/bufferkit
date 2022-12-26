import Foundation

public actor Buffer<S> where S : Bufferable {
    private(set) var loaded = false
    private var bufferable: S
    private var task: Task<(), Never>?
    private let url: URL
    
    init(buffered: S, file: String) {
        bufferable = buffered
        url = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask)[0].appending(
                path: file,
                directoryHint: .notDirectory)
    }
    
    var buffered: S {
        get async {
            if !loaded {
                if let load: S = await Task.detached(
                    priority: .utility, operation: { [weak self] in
                    guard
                        let url = self?.url,
                        var data = try? Data(contentsOf: url)
                    else { return nil }
                    return .init(data: &data)
                }).value {
                    bufferable = load
                }
                loaded = true
            }
            return bufferable
        }
    }
    
    func update(buffered: S) {
        task?.cancel()
        loaded = true
        bufferable = buffered
        task = Task.detached(priority: .utility) { [weak self] in
            guard let url = self?.url else { return }
            do {
                try await Task.sleep(nanoseconds: 1_000_000_000)
                try buffered.data.write(to: url, options: .atomic)
            } catch { }
        }
    }
}
