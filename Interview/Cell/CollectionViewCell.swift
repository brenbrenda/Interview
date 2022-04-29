//
//  CollectionViewCell.swift
//  Interview
//
//  Created by Brenda on 2022/4/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var numLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.cornerRadius = 20.0
    }

    func configure(viewModel: Lottery) {
        numLabel.text = viewModel.textValue
        numLabel.textColor = viewModel.textColor
        backgroundColor = viewModel.bgColor
    }
}
