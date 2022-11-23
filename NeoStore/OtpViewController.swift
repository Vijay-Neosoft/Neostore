//
//  OtpViewController.swift
//  NeoStore
//
//  Created by NeoSOFT on 14/08/1944 Saka.
//

import UIKit

class OtpViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var firstinput: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var thirdText: UITextField!
    @IBOutlet weak var fourthText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstinput.delegate = self
        self.secondText.delegate = self
        self.thirdText.delegate = self
        self.fourthText.delegate = self
        
        self.firstinput.tag = 0
        self.secondText.tag = 1
        self.thirdText.tag = 2
        self.fourthText.tag = 3
        
        // Do any additional setup after loading the view.
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        
//        return true
//    }
//    
    @IBAction func ToLogin(_ sender: Any)
    
    {
        guard  let text1 = firstinput.text, let text2 = secondText.text, let text3 = thirdText.text,
               let text4 = fourthText.text else {
            return
        }
        
        if (text1 == ""){
            let error = "Please Filled The OTP"
            print("please filled the ")
            showError(error: error)
        }else if (text2 == ""){
            let error = "Please Filled The OTP"
            print("please filled the detail")
            showError(error: error)
        }else if (text3 == ""){
            let error = "Please Filled The OTP"
            print("please filled the detail")
            showError(error: error)
        }else if (text4 == ""){
            let error = "Please Filled The OTP"
            print("please filled the detail")
            showError(error: error)
        }
        //let nav = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        sceneDelegate?.moveToLogin()
        // self.navigationController?.popToRootViewController(animated: true)
    }
    
    func showError(error : String){
        print("All fields mandtry!")
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
   
        
       
    }

