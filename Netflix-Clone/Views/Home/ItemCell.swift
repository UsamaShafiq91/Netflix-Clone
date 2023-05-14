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
    
    var item: Movie?
        
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = .clear
        
        imageView.kf.cancelDownloadTask()
        imageView.image = nil
    }
    
    func setData(item: Movie) {
        self.item = item
        
        guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(item.poster_path ?? "")") else {
            return
        }
        
        imageView.kf.setImage(with: imageUrl)
    }
}
