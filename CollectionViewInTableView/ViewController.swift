//
//  ViewController.swift
//  CollectionViewInTableView
//
//  Created by appinventiv on 08/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // TableViewOutlet--------
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    // Structre to Take data-------
    
    struct Objects  {
        var sectionname: String
        var name: [String]
        
        init(sectionname: String, name: [String]) {
            self.sectionname = sectionname
            self.name = name
        }
    }
    
    // Structure objects---------
    
    var objArr = [Objects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Register Header nib------
        
        let nibHeader = UINib(nibName: "HeaderOfTableView", bundle: nil)
        tableViewOutlet.register(nibHeader, forHeaderFooterViewReuseIdentifier: "HeaderOfTableViewId")
        
        // Register Cell nib------
        
        let nibCell = UINib(nibName: "CellOfTableView", bundle: nil)
        tableViewOutlet.register(nibCell, forCellReuseIdentifier: "CellOfTableViewId")
        
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        // Load structure objects---------
        
        objArr = [Objects(sectionname: "Cricket", name: ["Sachin", "Dhoni", "Rohit"]), Objects(sectionname: "Football", name: ["Ronaldo", "Messi", "Bekham"]), Objects(sectionname: "Tennis", name: ["Nadal", "Federer", "Sharapova", "Sania"])]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellOfTableViewId", for: indexPath) as? CellOfTableView else {
            fatalError("cell not make")
            }
         cell.populate(with: self.objArr[indexPath.section].name)
        print(objArr[indexPath.section].name)
       return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objArr.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderOfTableViewId") as? HeaderOfTableView
        
        header?.headerDatalabel.text = objArr[section].sectionname
        
        
        return header
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    
    
    
    
    
}

