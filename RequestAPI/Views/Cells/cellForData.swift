//
//  cellForData.swift
//  RequestAPI
//
//  Created by leo asula on 31/08/2022.
//

import UIKit

class cellForData: UITableViewCell {

    @IBOutlet weak var lbNameUni: UILabel!
    @IBOutlet weak var lbCountryUni: UILabel!
    @IBOutlet weak var lbAlphaCodeUni: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
