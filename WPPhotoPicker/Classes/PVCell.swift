//
//  PVCell.swift
//  WPPhotoPicker
//
//  Created by 王鹏 on 2020/1/3.
//

import UIKit
import Photos

// MARK: - 列表中单个
class PVItemCell: UICollectionViewCell {
    
    fileprivate let imageManager = PHCachingImageManager()
    
    var asset: PHAsset? {
        willSet {
            guard let asset = newValue  else {
                return
            }
            imageManager.requestImage(for: asset,
                                      targetSize: self.bounds.size,
                                      contentMode: .aspectFill,
                                      options: nil,
                                      resultHandler: { image, _ in
                                        
                                        self.imgView.image = image
            })
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imgView.frame = self.bounds
        self.addSubview(imgView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    lazy var imgView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
}
