//
//  FromWebViewController.swift
//  SKPhotoBrowserExample
//
//  Created by suzuki_keishi on 2015/10/06.
//  Copyright © 2015 suzuki_keishi. All rights reserved.
//

import UIKit
import SKPhotoBrowser
import SDWebImage

class FromWebViewController: UIViewController, SKPhotoBrowserDelegate {
    var images = [SKPhotoProtocol]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = nil
        SKDownloadOptons.isUrlCache = false
        SKCache.sharedCache.imageCache = CustomImageCache()
        let url = URL(string: "https://placehold.jp/150x150.png")
        let complated: SDWebImageCompletionBlock = { (image, error, cacheType, imageURL) -> Void in
            guard let url = imageURL?.absoluteString else { return }
            SKCache.sharedCache.setImage(image!, forKey: url)
        }
        
        
        let imageView = UIImageView()
        imageView.sd_setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535607967392&di=776fce1407140e3bb1a3096585bb21f2&imgtype=0&src=http%3A%2F%2Fimg3.iqilu.com%2Fdata%2Fattachment%2Fforum%2F201308%2F22%2F091918tf86buz3z8zszy6s.jpg")!)
        imageView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(imageView)
        
        let imageView2 = UIImageView()
        imageView2.sd_setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535607967391&di=91ff56e0519dc6a26eefc40b15ec48c7&imgtype=0&src=http%3A%2F%2Fp5.qhimg.com%2Ft018466356cc00893d0.jpg")!)
        imageView2.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(imageView2)
        
        let imageView3 = UIImageView()
        imageView3.sd_setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535607967391&di=a4f2e76ff6a57f08ed07cf25a9913094&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2017-11-28%2F5a1cf985b258a.jpg")!)
        imageView3.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(imageView3)
        
        let imageView4 = UIImageView()
        imageView4.sd_setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535607967391&di=c8ffd12b8af210dcf9289636c4fdc7c4&imgtype=0&src=http%3A%2F%2Fp17.qhimg.com%2Fbdr%2F__%2Fd%2F_open360%2Ffengjing0318%2F7.jpg")!)
        imageView4.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(imageView4)
        
        let imageView5 = UIImageView()
        imageView5.sd_setImage(with: URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535607967391&di=0b0bdedddd37692c653c7a6d8c3dff11&imgtype=0&src=http%3A%2F%2Fold.bz55.com%2Fuploads%2Fallimg%2F140624%2F138-140624144514.jpg")!)
        imageView5.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        self.view.addSubview(imageView5)
        
        
    }
    
    @IBAction func pushButton(_ sender: AnyObject) {
        let browser = SKPhotoBrowser(photos: createWebPhotos())
        browser.initializePageIndex(0)
        browser.delegate = self
        
        present(browser, animated: true, completion: nil)
    }
}

// MARK: - SKPhotoBrowserDelegate

extension FromWebViewController {
    func didDismissAtPageIndex(_ index: Int) {
    }
    
    func didDismissActionSheetWithButtonIndex(_ buttonIndex: Int, photoIndex: Int) {
    }
    
    func removePhoto(index: Int, reload: (() -> Void)) {
        SKCache.sharedCache.removeImageForKey("somekey")
        reload()
    }
}

// MARK: - private

private extension FromWebViewController {
    func createWebPhotos() -> [SKPhotoProtocol] {
        
        let urls: [String] = ["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535607967394&di=42954e890d4b107cc4577a26f5f2d0d0&imgtype=0&src=http%3A%2F%2Fbbsfiles.vivo.com.cn%2Fvivobbs%2Fattachment%2Fforum%2F201604%2F30%2F210251o957fzwwvpbepefd.jpg",
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535607967394&di=f14bb2dc701054bd8befd1ec40fe748b&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2Fadaf2edda3cc7cd9c21523b63101213fb80e91a0.jpg",
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535607967394&di=928d97ed5983ddf0ce7265224382d800&imgtype=0&src=http%3A%2F%2Fp15.qhimg.com%2Fbdr%2F__%2Fd%2F_open360%2Ffj0718%2F16.jpg",
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535607967394&di=ea12b5ea2b820cbaf09885053c1c23a9&imgtype=0&src=http%3A%2F%2Fbbsfiles.vivo.com.cn%2Fvivobbs%2Fattachment%2Fforum%2F201604%2F30%2F210252b00au3507q094uua.jpg",
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1535607967394&di=d2bf6f3bd5785011294c46178f569c3c&imgtype=0&src=http%3A%2F%2Fp18.qhimg.com%2Fbdr%2F__%2Fd%2F_open360%2Ffengjing0328%2F31.jpg"]
        
        return urls.enumerated().map({ (i, url) -> SKPhotoProtocol in
            let photo = SKPhoto.photoWithImageURL(url)
            photo.caption = caption[i%10]
            photo.shouldCachePhotoURLImage = true
            return photo
        })
//        return (0..<10).map { (i: Int) -> SKPhotoProtocol in
//            let photo = SKPhoto.photoWithImageURL("https://placehold.jp/15\(i)x15\(i).png")
//            photo.caption = caption[i%10]
//            photo.shouldCachePhotoURLImage = true
//            return photo
//        }
    }
}

class CustomImageCache: SKImageCacheable {
    var cache: SDImageCache
    
    init() {
        let cache = SDImageCache(namespace: "com.suzuki.custom.cache")
        self.cache = cache!
    }

    func imageForKey(_ key: String) -> UIImage? {
        guard let image = cache.imageFromDiskCache(forKey: key) else { return nil }
        
        return image
    }

    func setImage(_ image: UIImage, forKey key: String) {
        cache.store(image, forKey: key)
    }

    func removeImageForKey(_ key: String) {}
    
    func removeAllImages() {}
    
}


