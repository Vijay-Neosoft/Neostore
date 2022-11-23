//
//  SplashController.swift
//  NeoStore
//
//  Created by NeoSOFT on 11/08/1944 Saka.
//

import UIKit

class SplashController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2){
                    self.performSegue(withIdentifier: "openLogin", sender: nil)
                }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
