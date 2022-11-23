//
//  ProductListViewModel.swift
//  NeoStore
//
//  Created by NeoSOFT on 02/09/1944 Saka.

import Foundation
 
enum ProductListError : Error  {
    case productListEmpty
    
    public var localisedDescription : String {
        switch self {
        case .productListEmpty :
            return NSLocalizedString(
                "productListEmpty",
                comment: ""
            )
        }
    }
    
}

class ProductListViewModel {
    var failure:((Error?) -> ())?
    var success:(() -> ())?
    
   private var productList = [ProductData]()
    var productCount : Int {
    return productList.count
    }
    func getProduct(for index: Int) -> ProductViewModel {
        let product = productList[index]
        return ProductViewModel(productImage : product.product_images, productName: product.name, productProducer: product.producer, productCost: "Rs \(product.cost ?? 0)")
    }
    
    func fetchData(){
        let url = URL(string:"http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1")
        let dataTask = URLSession.shared.dataTask(with: url!,completionHandler: { data, response, error in
            guard let data = data ,error == nil else
            {
                print("Error occured While Accessing Data Url")
                self.failure?(error)
                return
            }
            var newProductList:FileData?
            do{
                newProductList = try JSONDecoder().decode(FileData.self, from: data)
                if let list = newProductList?.data {
                    self.productList = list
                    self.success?()
                } else {
                    self.failure?(ProductListError.productListEmpty)
                }
            }
            catch{
                print("Error occurs \(error)")
                self.failure?(error)
            }
        })
        
        dataTask.resume()
    }
}
