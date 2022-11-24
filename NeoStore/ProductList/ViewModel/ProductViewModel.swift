//
//  ProductViewModel.swift
//  NeoStore
//
//  Created by NeoSOFT on 02/09/1944 Saka.
//

import Foundation

class ProductViewModel {
    var productImage: String?
     var productName : String?
       var  productProducer: String?
       var productCost: String?
    init(productImage: String?,productName: String?,productProducer: String?, productCost: String?){
        self.productImage = productImage
        self.productName = productName
        self.productProducer = productProducer
        self.productCost = productCost
    }
    
}
