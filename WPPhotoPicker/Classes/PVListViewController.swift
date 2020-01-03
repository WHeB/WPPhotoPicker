//
//  PVListViewController.swift
//  Pods-WPPhotoPicker_Example
//
//  Created by 王鹏 on 2020/1/3.
//

import UIKit
import Photos

public class PVListViewController: UIViewController {

    var manger = PVManger()
    var fetchResult: PHFetchResult<PHAsset>!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        loadNavUI()
        getLibraryAsset()
        self.view.addSubview(collectionView)
    }
    
    private func loadNavUI() {
        self.title = "相册列表"
        
        let cancle = UIButton(type: .custom)
        cancle.setTitleColor(UIColor.black, for: .normal)
        cancle.setTitle("取消", for: .normal)
        cancle.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        cancle.addTarget(self, action: #selector(cancleAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancle)
    }
    
    @objc private func cancleAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsetsMake(0.5, 0, 0.5, 0)
        layout.itemSize = CGSize.init(width: (ScW - 3) / 4, height: (ScW - 3) / 4)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: ScW, height: ScH), collectionViewLayout: flowLayout)
        view.backgroundColor = UIColor.white
        view.dataSource = self
        view.delegate = self
        view.register(PVItemCell.self, forCellWithReuseIdentifier: "PVItemCell")
        return view
    }()
}

// MARK: - UICollectionViewDataSource UICollectionViewDelegate
extension PVListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResult.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PVItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PVItemCell", for: indexPath) as! PVItemCell
        cell.asset = fetchResult[indexPath.row]
        return cell
    }
}

// MARK: - 照片视频数据源
extension PVListViewController {
    
    private func getLibraryAsset() {
        if fetchResult == nil {
            let allOptions = PHFetchOptions()
            // 时间排序
            allOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate",
            ascending: false)]
            // 过滤类型
            switch manger.pvType {
            case .all:
                break
            case .photo:
                allOptions.predicate = NSPredicate(format: "mediaType == %ld", PHAssetMediaType.image.rawValue)
            case .video:
                allOptions.predicate = NSPredicate(format: "mediaType == %ld", PHAssetMediaType.video.rawValue)
            }
            fetchResult = PHAsset.fetchAssets(with: allOptions)
        }
    }
    
    
    
    
    
}
