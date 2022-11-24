
import UIKit

class ProfileTableViewCell: UITableViewCell {

    // #MARK -> Create a TableinputOutlet for textInput
    @IBOutlet weak var TableinputOutlet: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setupCell(text:String) {
        TableinputOutlet.text = text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
