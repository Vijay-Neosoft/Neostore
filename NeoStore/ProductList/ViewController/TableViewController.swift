//
//  TableViewController.swift
//  NeoStore
//
//  Created by Neosoft on 14/11/22.
//

import UIKit
import Kingfisher

class TableViewController: UIViewController {
    
    var ProductList = [ProductData]()
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()

    }
    
    func fetchData(){
        let url = URL(string:"http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1")
        let dataTask = URLSession.shared.dataTask(with: url!,completionHandler: { data, response, error in
            guard let data = data ,error == nil else
            {
                print("Error occured While Accessing Data Url")
                return
            }
            var newProductList:FileData?
            do{
                newProductList = try JSONDecoder().decode(FileData.self, from: data)
                self.ProductList = newProductList!.data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch{
                print("Error occurs \(error)")
            }
        })
        
        dataTask.resume()
    }
}

extension TableViewController:UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        if ProductList[indexPath.row].product_images != nil
        {

            cell.imageOL.contentMode = .scaleAspectFit
            if let  url = URL(string: ProductList[indexPath.row].product_images ?? ""){
                cell.imageOL.kf.setImage(with: url)
            }
        }
        else
        {
            cell.imageOL.image = UIImage(named: "emptyimage")
        }
        cell.titls.text = ProductList[indexPath.row].name
        cell.subTitle.text = ProductList[indexPath.row].producer
        cell.price.text = "Rs \(ProductList[indexPath.row].cost ?? 0)"
        return cell
    }
    
    
    
}

