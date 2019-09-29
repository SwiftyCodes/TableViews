//
//  HeaderView.swift
//  TableViews
//
//  Created by Anurag Kashyap on 29/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate {
    func headerViewWithIndex(index : Int)
}

class HeaderView: UIView {
    
    var delegate : HeaderViewDelegate?
    var index : Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var button : UIButton = {
       let button = UIButton(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height))
        button.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        button.titleLabel?.textColor = UIColor.white
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    @objc func buttonTapped() {
        print("header view")
        delegate?.headerViewWithIndex(index: index!)
    }
    
}
