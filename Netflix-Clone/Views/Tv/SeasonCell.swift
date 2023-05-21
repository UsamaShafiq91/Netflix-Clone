//
//  SeasonCell.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 20/05/2023.
//

import Foundation
import UIKit
import Kingfisher

class SeasonCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var seasonImageView: UIImageView!
    @IBOutlet weak var seasonDetailLabel: UILabel!
    
    var season: Season?

    override func awakeFromNib() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        seasonImageView.kf.cancelDownloadTask()
        seasonImageView.image = nil
    }
    
    func setData(season: Season) {
        self.season = season
        
        setSeasonImageView()
        setSeasonDetail()
    }
    
    func setSeasonImageView() {
        guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(season?.poster_path ?? "")") else {
            return
        }
        
        seasonImageView.kf.setImage(with: imageUrl)
    }
    
    func setSeasonDetail() {
        let seasonDetailAttributed = NSMutableAttributedString()
        
        seasonDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: season?.name))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))

        seasonDetailAttributed.append(NSAttributedString(string: "\(String.airDate): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        seasonDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: season?.air_date))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))

        seasonDetailAttributed.append(NSAttributedString(string: "\(String.numberOfEpisodes): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        seasonDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: season?.episode_count))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        seasonDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: season?.overview))", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        seasonDetailLabel.attributedText = seasonDetailAttributed
    }
    
    func getValidValue(value: Any?) -> String {
        var validValue = "-"
        
        if let int64Value = value as? Int64 {
            validValue = "\(int64Value)"
        }
        else if let intValue = value as? Int {
            validValue = "\(intValue)"
        }
        else if let doubleValue = value as? Double {
            validValue = "\(doubleValue)"
        }
        else if let stringValue = value as? String, !stringValue.isEmpty {
            validValue = stringValue
        }
        
        return validValue
    }
}
