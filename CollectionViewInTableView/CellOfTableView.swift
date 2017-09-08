//
//  CellOfTableViewTableViewCell.swift
//  CollectionViewInTableView
//
//  Created by appinventiv on 08/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class CellOfTableView: UITableViewCell {

    // Outlet for CollecTionView----------
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    var cellData = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nibCell = UINib(nibName: "CellOfCollectonView", bundle: nil)
        collectionViewOutlet.register(nibCell, forCellWithReuseIdentifier: "CellOfCollectonViewId")
        
        collectionViewOutlet.dataSource = self
        collectionViewOutlet.delegate = self
        
    }
    
    func populate(with data : [String]) {
        self.cellData = data
        self.collectionViewOutlet.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CellOfTableView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Enter in collectionView")
        return cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOfCollectonViewId", for: indexPath) as? CellOfCollectonView else {
            fatalError("Error in making Cell")
        }
        cell.dataLabel.text = cellData[indexPath.row]
        print("data storted in Label")
        cell.imageOutlet.image = UIImage(named: cellData[indexPath.row])
        return cell
   
    }
    
    // for the size of height and width of collectionView cell //
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    
    
    
    
    
    
}
