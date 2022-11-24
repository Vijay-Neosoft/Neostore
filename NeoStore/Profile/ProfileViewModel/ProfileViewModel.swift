
import Foundation

enum ProfileDataType: String {
    case firstName = "FirstName"
    case lastName = "lastName"
    case email = "Email"
    case phoneNO = "PhoneNO"
    case gender = "Gender"
    
}

class ProfileViewModel {

    func getProfileData(success :  ( _ responseData : IncomingData?) -> Void, errorBlock: ( _ errorData : String) -> Void) {
        if AuthManager.shared.user != nil{
            success(AuthManager.shared.user)
        }else{
            errorBlock("No data found!")
        }
    }
}
