import Foundation

struct Skill: Codable, FormModelProtocol {
    var name: String?
    
    func validate() -> (isValid: Bool, msg: String?) {
        if name.isNilOrEmpty {
            return (false, "Missing Data")
        }
        
        return (true, nil)
    }
}
