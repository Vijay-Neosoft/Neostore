
import Foundation

enum ProfileDataType: String {
    case firstName = "FirstName"
    case lastName = "lastName"
    case email = "Email"
    case phoneNO = "PhoneNO"
    case gender = "Gender"
}

struct ProfileData {
    var field : ProfileDataType
    var fieldInput : String
}

class ProfileViewModel {
    
    private var profileDataArray : [ProfileData]  = [ProfileData.init(field: .firstName, fieldInput: AuthManager.shared.user?.first_name ?? ""),ProfileData.init(field: .lastName, fieldInput: AuthManager.shared.user?.last_name ?? ""),ProfileData.init(field: .email, fieldInput: AuthManager.shared.user?.email ?? ""),ProfileData.init(field: .phoneNO, fieldInput: AuthManager.shared.user?.phone_no ?? ""),ProfileData.init(field: .gender, fieldInput: AuthManager.shared.user?.gender ?? "")]
    
    var profileDataCount: Int{
        return profileDataArray.count
    }
    
    func getProfileData(index:Int) ->ProfileData {
        return profileDataArray[index]
    }
    
}

