
import UIKit

class MainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titls: UILabel!
    
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var imageOL: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
