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
        
        return CGSize(width:view.frame.width,height:200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    //部品開発
    let titleLabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.purple
        label.text = "TEDxTokyo"
        label.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitle : UITextView = {
        let text = UITextView()
        text.backgroundColor = UIColor.red
        text.text = "TEDxTokyoは世界の最先端の情報を日本で取り扱うメディアサービスです。"
        text.font = UIFont.boldSystemFont(ofSize: 8)
        text.textColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let VideoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "images")
        return imageView
    }()
    
    let ProfileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let separatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    //表示
    func setupView() {
        
        addSubview(VideoImageView)
        addSubview(separatorView)
        addSubview(ProfileImage)
        addSubview(titleLabel)
        addSubview(subtitle)
        
        //autolayout
        addConstrainsWithFormat(format: "H:|-16-[v0]-16-|", views: VideoImageView)
        addConstrainsWithFormat(format: "H:|-16-[v0(44)]", views: ProfileImage)
        addConstrainsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: VideoImageView,ProfileImage,separatorView)
        addConstrainsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        addConstraint(NSLayoutConstraint(item:titleLabel, attribute: .top, relatedBy: .equal, toItem: VideoImageView, attribute: .bottom, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item:titleLabel, attribute: .left, relatedBy: .equal, toItem: ProfileImage, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item:titleLabel, attribute: .right, relatedBy: .equal, toItem: VideoImageView, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item:titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        addConstraint(NSLayoutConstraint(item:subtitle, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        addConstraint(NSLayoutConstraint(item:subtitle, attribute: .left, relatedBy: .equal, toItem: ProfileImage, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item:subtitle, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item:subtitle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//mainimageの表示
extension UIView {
    func addConstrainsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String:UIView]()
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
