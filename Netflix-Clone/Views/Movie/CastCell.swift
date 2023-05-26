//
//  ItemCell.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 09/05/2023.
//

import Foundation
import UIKit
import Kingfisher

class CastCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
        
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = .clear
        
        imageView.kf.cancelDownloadTask()
        imageView.image = nil
        
        detailLabel.attributedText = nil
    }
    
    func setData(cast: Cast) {
        let detailAttributed = NSMutableAttributedString()
        
        detailAttributed.append(NSAttributedString(string: "\(cast.name ?? "")\n", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        detailAttributed.append(NSAttributedString(string: "\(cast.character ?? "")", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        detailLabel.attributedText = detailAttributed
        detailLabel.backgroundColor = .backgroundColor.withAlphaComponent(0.5)
        
        guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(cast.profile_path ?? "")") else {
            return
        }
        
        imageView.kf.setImage(with: imageUrl)
    }
}
