import Foundation

public class SimpleLogger: Logger {
    private(set) var level: LogLevel
    
    init(level: LogLevel) {
        self.level = level
    }
    
    func format(level: LogLevel, message: String) -> String {
        var date: String
        if #available(macOS 12.0, iOS 15.0, watchOS 8.0, *) {
            date = Date().ISO8601Format()
        } else {
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.timeStyle = .full
            
            date = formatter.string(from: Date())
        }
            
        return "\(date) [\(levelSymbol(level))] \(message)"
    }
    
    public func log(_ level: LogLevel, message: String) {
        guard level.rawValue >= self.level.rawValue else { return }
        
        print(format(level: level, message: message))
    }
    
    public func verbose(_ message: String) {
        log(.verbose, message: message)
    }
    
    public func debug(_ message: String) {
        log(.debug, message: message)
    }
    
    public func info(_ message: String) {
        log(.info, message: message)
    }
    
    public func warning(_ message: String) {
        log(.warning, message: message)
    }
    
    public func error(_ error: Error, message: String) {
        log(.error, message: "\(message)\n\(error.localizedDescription)")
    }
    
    private func levelSymbol(_ level: LogLevel) -> Character {
        switch level {
        case .verbose: return "💬"
        case .debug: return "💎"
        case .info: return "ℹ️"
        case .warning: return "⚠️"
        case .error: return "❌"
        }
    }
}

public protocol Logger {
    func log(_ level: LogLevel, message: String)
    
    func verbose(_ message: String)
    
    func debug(_ message: String)
    
    func info(_ message: String)
    
    func warning(_ message: String)
    
    func error(_ error: Error, message: String)
}

public enum LogLevel: Int {
    case verbose = 0, debug, info, warning, error
}
