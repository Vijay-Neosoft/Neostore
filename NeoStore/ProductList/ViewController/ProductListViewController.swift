

import UIKit
import Kingfisher

class ProductListViewController: UIViewController {

    var productlistViewModel = ProductListViewModel()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productlistViewModel.fetchData()
           bind()
    }
    func bind(){
        productlistViewModel.success = { [weak self ] in
            guard let strongSelf = self else {
                return
            }
            DispatchQueue.main.async {
                strongSelf.tableView.reloadData()
            }
            
        }
        productlistViewModel.failure = { [weak self ] error -> Void  in
            guard let strongSelf =  self else {
                return
            }
            strongSelf.showError(error: error?.localizedDescription)
        }
        
    }
}

extension ProductListViewController : UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productlistViewModel.productCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainTableViewCell
        else {
            return UITableViewCell()
        }
        cell.productViewModel = productlistViewModel.getProduct(for: indexPath.row)
        return cell
    }
    
    
    
}
