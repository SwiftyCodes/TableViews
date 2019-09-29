//
//  ButtonInCell_VC.swift
//  TableViews
//
//  Created by Anurag Kashyap on 29/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class ButtonInCell_VC: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ButtonInCell_VC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
        cell.buttonInCell.setTitle("\(indexPath.row)", for: .normal)
        cell.delegate = self
        cell.index = indexPath.row
        return cell
    }
    
}

extension ButtonInCell_VC : ButtonTableViewCellDelegate {
    
    func butonIndex(index : Int) {
        print(index)
    }
}
