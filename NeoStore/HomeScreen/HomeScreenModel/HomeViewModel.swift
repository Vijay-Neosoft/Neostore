//
//  HomeViewModel.swift
//  NeoStore
//
//  Created by Neosoft on 12/12/22.
//

import Foundation

class HomeViewModel {
   
    let UIImageSlider:[String] = ["slider_img1","slider_img2","slider_img3","slider_img4"]
    let UISubImage:[String] = ["chairsicon","tableicon","cupboardicon","sofaicon"]
    
    func HeaderCollectionVIewData(ind imageIndex : Int) -> String {
        return UIImageSlider[imageIndex]
    }
    
    func SubHomeCollectionVewData(ind imageIndex : Int) -> String {
        return UISubImage[imageIndex]
        
    }
    
    var HomeDataCount: Int{
        return UIImageSlider.count
    }
    
    var SubHomeDataCount: Int{
        return UIImageSlider.count
    }
}



