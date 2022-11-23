//
//  LoginViewModel.swift
//  NeoStore
//
//  Created by NeoSOFT on 30/08/1944 Saka.
//

import Foundation
import Alamofire

class LoginViewModel{
    
    var showLoader: (() -> ())?
    var success: (() -> Void )?
    var failure: ((Error?) -> Void )?
    var validationError : ((String) -> Void )?
    
    func login(request: RegisterData) {
        
        let params: [String:Any] = [
            "email":request.email,
            "password": request.password
        ]
        print(params)
        showLoader?()
        AF.request("http://staging.php-dev.in:8844/trainingapp/api/users/login", method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: ["Content-Type": "application/x-www-form-urlencoded"]).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let userResponse = try jsonDecoder.decode(UserResponse.self, from: data)
                    print(userResponse.data ?? IncomingData())
                    AuthManager.shared.user = userResponse.data
                    self.success?()
                }
                catch {
                    self.failure?(error)
                    print(error)
                    
                }
            case .failure(let error):
                self.failure?(error)
                print(error)
            }
        }
        
    }
    
    func validateLoginFields(request: RegisterData) -> Bool {
        var isValid: Bool = false
        
        if(request.email == "" && request.password ==  "" ) {
            let error = "Please Filled All details "
            print("Please Filled All details")
            validationError?(error )
        }
        else if(request.email == "" ){
            let error = "Please Enter mail id"
            print("Please Enter Last Name")
            validationError?(error)
        }
        else if (request.email == "" && request.password ==  "") {
            let error = "please filled all details"
            print("gender selected")
            validationError?(error)
        }
        else if !(request.email.validateEmail()) {
            let error = "Please Enter Valid email id"
            print("mail valid")
            validationError?(error)
        }
        else if !(request.password.validatePassword()){
            let error = "Please Enter Valid password"
            print("valid password")
            validationError?(error)
        }
        else{
            isValid = true
        }
        return isValid
    }
    
}
