//
//  SignUpController.swift
//  NeoStore
//
//  Created by Neosoft on 07/11/22.
//

import UIKit
import Alamofire

class SignUpController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var confirmPasswordTexField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var buttonFemale: UIButton!
    @IBOutlet weak var buttonMale: UIButton!
    
    @IBOutlet weak var dOB: UIButton!
    
    var gender = ""
    var modelObject = RegisterData()
    
    var signUpViewModel = SignUpViewModel()
    var newData  = [IncomingData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        let maxDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())
        let dateString = maxDate?.dateString("MMM-dd-YYYY")
        self.dOB.setTitle(dateString, for: .normal)
        modelObject.dateOfBirth = dateString ?? ""
        
        buttonMale.setImage(UIImage.init(named: "Unchekded"), for: .normal)
        buttonMale.setImage(UIImage.init(named: "checked"), for: .selected)
        buttonFemale.setImage(UIImage.init(named: "Unchekded"), for: .normal)
        buttonFemale.setImage(UIImage.init(named: "checked"), for: .selected)
        buttonMale.isSelected = true
        
    }
    func bind(){
        signUpViewModel.success = { [weak self] in
            guard let self = self  else{
                return
            }
            self.OTP()
        }
        
        signUpViewModel.failure = { [weak self ] error in
            guard let self = self else {
                return
            }
            
            self.showError(error: error?.localizedDescription)
        }
        signUpViewModel.validationError = {[weak self ] errorMessage in
            guard let self = self else {
                return
            }
            self.showError(error: errorMessage)
        }
    }
    
    @IBAction func buttonSelectGender(_ sender: UIButton) {
        if sender == buttonMale{
            buttonMale.isSelected = true
            buttonFemale.isSelected = false
        }else{
            buttonMale.isSelected = false
            buttonFemale.isSelected = true
        }
    }
    
    func OTP() {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OtpViewController") as? OtpViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func dateOfBirthAction(_ sender: Any) {
        let minDate = Calendar.current.date(byAdding: .year, value: -100, to: Date())
        
        let maxDate = Calendar.current.date(byAdding: .year, value: -18, to: Date())
        RPicker.selectDate(title: "Select Date", minDate: minDate, maxDate: maxDate, didSelectDate: {[weak self] (selectedDate) in
            let dateString =  selectedDate.dateString("MMM-dd-YYYY")
            self?.dOB.setTitle(dateString, for: .normal)
            self?.modelObject.dateOfBirth = dateString
        })
        
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        self.view.endEditing(true)
        let request = RegisterData(firstName: firstNameTextField.text ?? "",lastName: lastNameTextField.text ?? "",phoneNo: phoneNumberTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "",ConfirmPassword: confirmPasswordTexField.text ?? "", gender: buttonMale.isSelected ? "M" : "F")
        if signUpViewModel.validateSignUpFields(request: request) {
            signUpViewModel.signUp(request: request)
        }
    }
}

extension SignUpController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField.tag {
        case 100:
            modelObject.firstName = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        case 101:
            modelObject.lastName = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        case 102:
            modelObject.email = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        case 103:
            modelObject.phoneNo = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        case 104:
            modelObject.password = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        case 105:
            modelObject.ConfirmPassword = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        default: break
        }
    }
}

