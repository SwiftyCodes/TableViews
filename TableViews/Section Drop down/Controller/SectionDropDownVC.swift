//
//  SectionDropDownVC.swift
//  TableViews
//
//  Created by Anurag Kashyap on 29/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class SectionDropDownVC: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    var data = [DataModel(headerName: "Mens", typesArray: ["Belts","Comb","Shoes","Shirts","Jeans"], isExpandable: false),DataModel(headerName: "Womens", typesArray: ["Frocks","Saree","Makeup"], isExpandable: false),DataModel(headerName: "Kids", typesArray: ["Mobile","Football","Bat"], isExpandable: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }

}

extension SectionDropDownVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if data[section].isExpandable {
            return data[section].typesArray.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section].typesArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderView(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width - 20, height: 40))
        headerView.delegate = self
        headerView.index = section
        headerView.button.setTitle(data[section].headerName, for: .normal)
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension SectionDropDownVC : HeaderViewDelegate {
    func headerViewWithIndex(index: Int) {
        data[index].isExpandable = !data[index].isExpandable
        tableView.reloadSections([index], with: .automatic)
    }
}
