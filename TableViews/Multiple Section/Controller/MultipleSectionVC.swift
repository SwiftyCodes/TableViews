//
//  MultipleSectionVC.swift
//  TableViews
//
//  Created by Anurag Kashyap on 29/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

class MobileBrand {
    
    var brandName: String?
    var modelName: [String]?
    
    
    init(brandName: String, modelName: [String]) {
        self.brandName = brandName
        self.modelName = modelName
    }
}

class MultipleSectionVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var mobileBrand = [MobileBrand]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileBrand.append(MobileBrand.init(brandName: "Apple", modelName: ["iPhone 5s","iPhone 6","iPhone 6s", "iPhone 7+", "iPhone 8", "iPhone 8+", "iPhone 11", "iPhone 11 Pro"]))
        mobileBrand.append(MobileBrand.init(brandName: "Samsung", modelName: ["Samsung M Series", "Samsung Galaxy Note 9", "Samsung Galaxy Note 9+", "Samsung Galaxy Note 10", "Samsung Galaxy Note 10 +"]))
        mobileBrand.append(MobileBrand.init(brandName: "Mi", modelName: ["Mi Note 7", "Mi Note 7 Pro", "Mi K20"]))
        mobileBrand.append(MobileBrand.init(brandName: "Huawei", modelName: ["Huawei Mate 20", "Huawei P30 Pro", "Huawei P10 Plus", "Huawei P20"]))
        
    }
}

extension MultipleSectionVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mobileBrand.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mobileBrand[section].modelName?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = mobileBrand[indexPath.section].modelName?[indexPath.row]
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return mobileBrand[section].brandName
    //    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = #colorLiteral(red: 1, green: 0.3653766513, blue: 0.1507387459, alpha: 1)
        
        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.text = mobileBrand[section].brandName
        view.addSubview(lbl)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

}
