import Foundation

extension NSObject {
    static var identifier: String {
        return String(describing: self)
    }
}
