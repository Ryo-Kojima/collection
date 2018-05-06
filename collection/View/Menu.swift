//
//  Menu.swift
//  collection
//
//  Created by 小嶋涼 on 2018/05/06.
//  Copyright © 2018年 小嶋涼. All rights reserved.
//

import UIKit

class Menu: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionview : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red:31, green:230, blue:32)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let imagenames = ["home", "trending", "subscriptions", "acount"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionview.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionview)
        addConstrainsWithFormat(format: "H:|[v0]|", views: collectionview)
        addConstrainsWithFormat(format: "V:|[v0]|", views: collectionview)
        
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionview.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imagenames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.rgb(red: 13, green: 91, blue: 43)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class MenuCell: BaseCell {
    
    let imageView : UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.rgb(red: 13, green: 91, blue: 43)
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 13, green: 91, blue: 43)
        }
    }
    
    override var isSelected : Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 13, green: 91, blue: 43)
        }
    }
    
    override func setupView() {
        super.setupView()
        
        addSubview(imageView)
        addConstrainsWithFormat(format: "H:|-22-[v0(35)]-22-|", views: imageView)
        addConstrainsWithFormat(format: "V:|[v0(35)]|", views: imageView)
        
        addConstraint(NSLayoutConstraint(item:imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item:imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
