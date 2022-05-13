import Foundation

enum EducationClass: String, Codable {
    case x = "X"
    case xii = "XII"
    case graduation = "Graduation"
}

struct EducationDetail: Codable, FormModelProtocol {
    var educationClass: String?
    var passingYear: String?
    var cgpa: String?
    
    func validate() -> (isValid: Bool, msg: String?) {
        if educationClass.isNilOrEmpty || passingYear.isNilOrEmpty || cgpa.isNilOrEmpty {
            return (false, "Missing data")
        }
        
        if let passingYear = passingYear, Int(passingYear) == nil {
            return (false, "Wrong Passing Year")
        }
        
        if let cgpa = cgpa, Double(cgpa) == nil {
            return (false, "Wrong CGPA")
        }
        
        return (true, nil)
    }
}
