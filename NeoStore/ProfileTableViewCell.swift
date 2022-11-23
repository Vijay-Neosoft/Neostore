//
//  ProfileTableViewCell.swift
//  NeoStore
//
//  Created by Neosoft on 14/11/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var inputOL: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(text:String) {
        inputOL.text = text

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
