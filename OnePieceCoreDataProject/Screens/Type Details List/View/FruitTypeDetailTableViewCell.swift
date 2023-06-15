//
//  FruitTypeDetailTableViewCell.swift
//  OnePieceCoreDataProject
//
//  Created by Sadia on 14/6/23.
//

import UIKit
import Kingfisher

class FruitTypeDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fruitImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var fruitNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fruitImageView.layer.cornerRadius = fruitImageView.frame.size.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(fruitDetail: FruitDetailsEntity){
        fruitNameLabel.text = fruitDetail.fruitName
        userNameLabel.text = fruitDetail.userName
        fruitImageView.setImage(with: fruitDetail.imageURL!)
    }
}
