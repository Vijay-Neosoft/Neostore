//
//  UIViewController+Extension.swift
//  NeoStore
//
//  Created by NeoSOFT on 25/08/1944 Saka.
//


import UIKit

extension UIViewController{
    
    var sceneDelegate : SceneDelegate? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate
        else {
            return nil
        }
        return sceneDelegate
     
    }
//    func getSceneDelegate() -> SceneDelegate? {
//        
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//              let sceneDelegate = windowScene.delegate as? SceneDelegate
//        else {
//            return nil
//        }
//        return sceneDelegate
//    }
    func showError(error : String?){
        print("All fields mandtry!")
        let alert = UIAlertController(title: "Alert", message: error ?? "" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
