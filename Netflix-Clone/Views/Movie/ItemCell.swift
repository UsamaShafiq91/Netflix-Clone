//
//  ItemCell.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 09/05/2023.
//

import Foundation
import UIKit
import Kingfisher

class ItemCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var itemImage: String?
        
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = .clear
        
        imageView.kf.cancelDownloadTask()
        imageView.image = nil
    }
    
    func setData(itemImage: String?) {
        self.itemImage = itemImage
        
        guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(itemImage ?? "")") else {
            return
        }
        
        imageView.kf.setImage(with: imageUrl)
    }
}
