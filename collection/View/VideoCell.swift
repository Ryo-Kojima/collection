//
//  VideoCell.swift
//  collection
//
//  Created by 小嶋涼 on 2018/05/05.
//  Copyright © 2018年 小嶋涼. All rights reserved.
//

import UIKit

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    //部品開発
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "TEDxTokyo"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitle : UITextView = {
        let text = UITextView()
        text.text = "TEDxTokyo - present1"
        text.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        text.textColor = UIColor.lightGray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let VideoImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "images")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let ProfileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let separatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
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
