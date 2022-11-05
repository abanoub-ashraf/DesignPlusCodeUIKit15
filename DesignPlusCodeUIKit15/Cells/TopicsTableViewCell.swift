//
//  TopicsTableViewCell.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 05/11/2022.
//

import UIKit

class TopicsTableViewCell: UITableViewCell {

    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var topicIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
