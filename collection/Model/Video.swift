//
//  Video.swift
//  collection
//
//  Created by 小嶋涼 on 2018/05/13.
//  Copyright © 2018年 小嶋涼. All rights reserved.
//

import UIKit

class Video : NSObject {
    
    var VideoImageView : String?
    var title : String?
    var numerOfView : NSNumber?
    var uploadDate : NSDate?
    
    var channel : Channel?
}

class Channel: NSObject {
    var name : String?
    var ProfileImage : String?
}
