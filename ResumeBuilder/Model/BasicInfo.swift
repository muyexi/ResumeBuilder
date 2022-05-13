import Foundation

struct BasicInfo: Codable, FormModelProtocol {
    var mobileNumber: String?
    var emailAddress: String?
    var residenceAddress: String?
    
    var careerObjective: String?
    var yearsOfExperience: String?
    
    func validate() -> (isValid: Bool, msg: String?) {
        if mobileNumber.isNilOrEmpty
            && emailAddress.isNilOrEmpty
            && residenceAddress.isNilOrEmpty
            && careerObjective.isNilOrEmpty
            && yearsOfExperience.isNilOrEmpty {
            return (false, "Missing Data")
        }
                
        return (true, nil)
    }
}
