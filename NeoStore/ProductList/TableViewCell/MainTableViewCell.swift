
import UIKit
import Kingfisher

class MainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titls: UILabel!
    
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var imageOL: UIImageView!
    var productViewModel: ProductViewModel? {
    didSet{
        self.titls.text = productViewModel?.productName ?? ""
        self.subTitle.text = productViewModel?.productProducer ?? ""
        self.price.text = productViewModel?.productCost ?? ""
        if let image = productViewModel?.productImage
        {

          self.imageOL.contentMode = .scaleAspectFit
            if let  url = URL(string: image){
                self.imageOL.kf.setImage(with: url)
            }
        }
        else
        {
            self.imageOL.image = UIImage(named: "emptyimage")
        }
    }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
