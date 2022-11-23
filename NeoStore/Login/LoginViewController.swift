//
//  ViewController.swift
//  NeoStore
//
//  Created by NeoSOFT on 11/08/1944 Saka.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicatorView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var newData  = [IncomingData]()
    var loginViewModel = LoginViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    func bind(){
        loginViewModel.success = { [weak self] in
            guard let self = self  else{
                return
            }
            self.hideLoader()
            self.homeAction()
            
        }
        loginViewModel.showLoader = {[weak self] in
            guard let self = self else {
                return
            }
            self.showLoader()
        }
        loginViewModel.failure = { [weak self ] error in
            guard let self = self else {
                return
            }
            self.hideLoader()
            self.showError(error: error?.localizedDescription)
        }
        loginViewModel.validationError = {[weak self ] errorMessage in
            guard let self = self else {
                return
            }
            self.showError(error: errorMessage)
        }
    }
    func showLoader(){
        self.activityIndicator.isHidden = false
               self.activityIndicatorView.isHidden = false
                self.activityIndicator.startAnimating()
    }
    func hideLoader(){
        self.activityIndicator.isHidden = true
               self.activityIndicatorView.isHidden = true
                self.activityIndicator.stopAnimating()
    }
    func homeAction() {
        guard let tabHome = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabbarController") as? TabbarController
        else {
            return
        }
        self.navigationController?.pushViewController(tabHome, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func RegForm(_ sender: Any) {
       guard let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignUpController") as? SignUpController
        else{
           return
       }
        self.navigationController?.pushViewController(vc, animated: true)
      
    }
   
    @IBAction func onSubmit(_ sender: Any) {
        self.view.endEditing(true)
        let request = RegisterData(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        if loginViewModel.validateLoginFields(request: request) {
            loginViewModel.login(request: request)
        }
        }
    }

    
    


