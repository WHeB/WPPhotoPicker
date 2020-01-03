//
//  PVManger.swift
//  Pods-WPPhotoPicker_Example
//
//  Created by 王鹏 on 2020/1/3.
//

import UIKit

public enum PVType {
    case all        // 所有
    case photo      // 图片
    case video      // 视频
}

public class PVManger: NSObject {

    // 需要展示的类型。默认 all
    public var pvType = PVType.all
    
    // 是否为单选模式。默认 false
    public var singleSelected = false
    
    // 照片是否可以编辑。默认 false
    public var photoCanEdit = false
    
    // 视频是否可以编辑。默认 false
    public var videoCanEdit = false
    
    // 是否选择视频封面。默认 false
    public var chooseVideoCover = false
    
    
    
}


