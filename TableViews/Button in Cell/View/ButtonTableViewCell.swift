//
//  ButtonTableViewCell.swift
//  TableViews
//
//  Created by Anurag Kashyap on 29/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate {
    func butonIndex(index : Int)
}

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var buttonInCell : UIButton!
    var delegate : ButtonTableViewCellDelegate?
    var index : Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buttonInCell.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        delegate?.butonIndex(index: index!)
    }
}
