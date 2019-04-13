//
//  ViewController.swift
//  TagSystem
//
//  Created by Igor Marcos on 13/04/19.
//  Copyright © 2019 Igor Marcos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    var sizingCell: TagCell?
    
    let TAGS = ["Tech", "Design", "Humor", "Travel", "Music", "Writing", "Social Media", "Life", "Education", "Edtech", "Education Reform", "Photography", "Startup", "Poetry", "Women In Tech", "Female Founders", "Business", "Fiction", "Love", "Food", "Sports"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "TagCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "TagCell")
        self.collectionView.backgroundColor = UIColor.clear
        self.sizingCell = (cellNib.instantiate(withOwner: nil, options: nil) as NSArray).firstObject as! TagCell
        self.flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TAGS.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCell
        configureCell(cell: cell, forIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: TagCell, forIndexPath indexPath: IndexPath){
        let tag = TAGS[indexPath.row]
        cell.tagName.text = tag
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize{
        self.configureCell(cell: self.sizingCell!, forIndexPath: indexPath)
        return self.sizingCell!.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
