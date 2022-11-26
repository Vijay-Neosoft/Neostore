//
//  SignUpViewModel.swift
//  NeoStore
//
//  Created by NeoSOFT on 01/09/1944 Saka.
//

import Foundation
import Alamofire

enum ApiError: Error {
    case cannotConvertToJSON
    case cannotConvertToPrettyJSON
    case couldJSONToString
    public var localisedDescription : String? {
        switch self {
        case .cannotConvertToJSON :
            return NSLocalizedString(
                " Cannot convert data to JSON object",
                comment: ""
            )
        case .cannotConvertToPrettyJSON:
            return NSLocalizedString(
                " Cannot convert JSON object to Pretty JSON data ",
                comment: ""
            )
        case .couldJSONToString:
            return NSLocalizedString(
                " Could print JSON in String ",
                comment: ""
            )
        
        }
    }
}
class SignUpViewModel {
    
    var showLoader: (() -> ())?
    var success: (() -> Void )?
    var failure: ((Error?) -> Void )?
    typealias ValidationError = ((String) -> Void )
    var validationError : ValidationError?
 
    
    func signUp(request: RegisterData) {
        
        let params: [String:Any] = [
            "first_name":request.firstName,
            "last_name":request.lastName,
            "phone_no":request.phoneNo,
            "email":request.email,
            "password": request.password,
            "confirm_password":request.ConfirmPassword,
            "gender":request.gender
            
        ]
        print(params)
        AF.request("http://staging.php-dev.in:8844/trainingapp/api/users/register", method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: ["Content-Type": "application/x-www-form-urlencoded"]).validate(statusCode: 200 ..< 299).responseData { response in
            if let data = response.data {
                print(String(data:data, encoding: .utf8) ??  "")
                switch response.result {
                case .success(let data):
                    do {
                        
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {                            self.failure?(ApiError.cannotConvertToJSON)
                            return
                        }
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {                            self.failure?(ApiError.cannotConvertToPrettyJSON)
                            return
                        }
                        guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                                   self.failure?(ApiError.couldJSONToString)
                            return
                        }
                        print(prettyPrintedJson)
                        self.success?()
                       
                    } catch {
                        self.failure?(ApiError.couldJSONToString)
                        return
                    }
                case .failure(let error):
                    print(error)
                    self.failure?(error)
                    
                }
            }
        }
    }
    func validateSignUpFields(request: RegisterData) -> Bool {
        var isValid: Bool = false
        
        if (request.firstName == "" && request.password ==  "" && request.phoneNo == "" && request.lastName == "" && request.firstName == "" ){
            let error = "Please Fill The Details "
            print("Please Fill The Details ")
            validationError?(error )
        }
        else if(request.firstName == "" ){
            let error = "Please Enter First Name"
            print("Please Enter First Name")
            validationError?(error )
        }
        else if !(request.firstName.validateName()) {
            let error = "First name's length must be more than 3 characters"
            print("Please Enter First Name")
            validationError?(error )
        }
        
        else if(request.lastName == "" ){
            let error = "Please Enter Last Name "
            print("Please Enter Last Name")
            validationError?(error )
        }
        else if(request.email == "" && request.password ==  "" && request.phoneNo == "" && request.lastName == ""  ){
            let error = "Please Filled All details "
            print("please filled all details")
            validationError?(error )
        }
        
        else if !(request.lastName.validateName()){
            let error = "Last name's length must be more than 3 characters"
            print("invalid last name")
            validationError?(error )
        }
        else if(request.email == "" ){
            let error = "Please Enter mail id"
            print("Please Enter Last Name")
            validationError?(error )
        }
        else if(request.email == "" && request.password ==  "" && request.phoneNo == "" && request.firstName == "" ){
            let error = "please filled all details"
            print("please filled all details")
            validationError?(error )
        }
        else if !(request.email.validateEmail()){
            let error = "Please Enter Valid email id"
            print("mail valid")
            validationError?(error )
        }
        else if(request.phoneNo == "" ){
            let error = "Please Enter Phone Number"
            print("Please Enter Phone Number")
            validationError?(error )
        }else if !(request.phoneNo.validatePhone()){
            let error = "Please Enter Valid phone No"
            print("phoneno Invalid")
            validationError?(error )
        }
        else if !(request.password.validatePassword()) {
            let error = "Please Enter Valid password"
            print("valid password")
            validationError?(error )
            //showError(error: error)
        }else if !(request.ConfirmPassword == request.password){
            let error = "Please Enter confirm password doesn't match with password"
            print("confirm password doesn't match with password")
            validationError?(error )
        }
        else{
            isValid = true
        }
        return isValid
    }
}
