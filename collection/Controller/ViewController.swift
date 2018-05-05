//
//  ViewController.swift
//  collection
//
//  Created by 小嶋涼 on 2018/04/15.
//  Copyright © 2018年 小嶋涼. All rights reserved.
//

import UIKit
import Firebase
class homeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //ナビとセルの構築
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x:0, y:0, width:view.frame.width - 32, height:view.frame.height))
        titleLabel.text = "HOME"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = UIColor.white
        navigationItem.titleView = titleLabel
        
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //セッションの数の設定
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    //セルの接続
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath)
    
        return cell
    }
    
    //セルのレイアウトサイズ設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width:view.frame.width,height:height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
