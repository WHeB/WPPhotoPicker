//
//  PV+Extension.swift
//  WPPhotoPicker
//
//  Created by 王鹏 on 2020/1/3.
//

import UIKit

internal var ScW = UIScreen.main.bounds.size.width
internal var ScH = UIScreen.main.bounds.size.height

internal extension UIView {
    
    /// 是否有齐刘海
    var isHasSafeArea: Bool {
        if UIDevice.current.userInterfaceIdiom != UIUserInterfaceIdiom.phone {
            return false
        }
        if #available(iOS 11.0, *) {
            let kWindow = UIApplication.shared.keyWindow
            if let wb = kWindow?.safeAreaInsets.bottom,
                wb > 0.0 {
                return true
            }
        }
        return false
    }
    
    /// x值
     var pv_x: CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    
    /// y值
     var pv_y: CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    
    /// 右边界的x值
     var pv_rightX: CGFloat{
        get{
            return self.pv_x + self.pv_width
        }
        set{
            var r = self.frame
            r.origin.x = newValue - frame.size.width
            self.frame = r
        }
    }
    
    /// 下边界的y值
     var pv_bottomY: CGFloat{
        get{
            return self.pv_y + self.pv_height
        }
        set{
            var r = self.frame
            r.origin.y = newValue - frame.size.height
            self.frame = r
        }
    }
    
    /// 中心x值
     var pv_centerX : CGFloat{
        get{
            return self.center.x
        }
        set{
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    /// 中心y值
     var pv_centerY : CGFloat{
        get{
            return self.center.y
        }
        set{
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    /// 宽度
     var pv_width: CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            var r = self.frame
            r.size.width = newValue
            self.frame = r
        }
    }
    
    /// 高度
     var pv_height: CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            var r = self.frame
            r.size.height = newValue
            self.frame = r
        }
    }
    
    /// 起点
     var pv_origin: CGPoint{
        get{
            return self.frame.origin
        }
        set{
            self.pv_x = newValue.x
            self.pv_y = newValue.y
        }
    }
    
    /// 大小
     var pv_size: CGSize{
        get{
            return self.frame.size
        }
        set{
            self.pv_width = newValue.width
            self.pv_height = newValue.height
        }
    }
}
