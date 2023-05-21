//
//  TvSeriesDetailViewController.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 14/05/2023.
//

import Foundation
import UIKit
import WebKit

class TvSeriesDetailViewController: UIViewController {
    
    @IBOutlet weak var tvSeriesImageView: UIImageView!
    @IBOutlet weak var tvSeriesNameLabel: UILabel!
    @IBOutlet weak var tvSeriesDetailLabel: UILabel!
    @IBOutlet weak var tvSeriesPlotLabel: UILabel!
    @IBOutlet weak var trailerWebView: WKWebView!
    @IBOutlet weak var seasonTableView: ContentSizedTableView!

    var seriesId: Int?
    var tvSeriesDetailService: TvSeriesDetailService?
    var tvSeriesDetail: TvSeriesDetail?
    var credits: Credits?
    var videos: Videos?
    var seasons: [Season] = []

    override func viewDidLoad() {
        
        getMovieData()
    }
    
    func getMovieData() {
        tvSeriesDetailService = TvSeriesServiceAdapter()
        
        getTvSeriesCredits()
        getTvSeriesVideos()
        getTvSeriesDetail()
    }
    
    func getTvSeriesCredits() {
        guard let seriesId = seriesId else { return }
        
        tvSeriesDetailService?.getTvSeriesCredits(seriesId: seriesId, completion: { [weak self] response in
            
            guard let data = response.data else { return }
            
            self?.credits = data
            
            self?.setupTvSeriesData()
        })
    }
    
    func getTvSeriesVideos() {
        guard let seriesId = seriesId else { return }
        
        tvSeriesDetailService?.getTvSeriesVideos(seriesId: seriesId, completion: { [weak self] response in
            
            guard let data = response.data else { return }
            
            self?.videos = data
            
            self?.setupMovieTrailer()
        })
    }
    
    func setupMovieTrailer() {
        guard let results = videos?.results, results.count > 0 else { return }
        
        var trailer: Video?
        
        if let officialTrailer = results.first(where: {$0.site == "YouTube" && $0.type == "Trailer" && $0.official == true && $0.iso_639_1 == "en"}) {
            trailer = officialTrailer
        }
        else if let otherTrailer = results.first(where: {$0.site == "YouTube" && $0.type == "Trailer" && $0.iso_639_1 == "en"}) {
            trailer = otherTrailer
        }
        else if let anyVideo = results.first(where: {$0.site == "YouTube" && $0.iso_639_1 == "en"}) {
            trailer = anyVideo
        }
            
        guard let videoId = trailer?.key, let videoUrl = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
        
        trailerWebView.load(URLRequest(url: videoUrl))
    }
    
    func getTvSeriesDetail() {
        guard let seriesId = seriesId else { return }
        
        tvSeriesDetailService?.getTvSeriesDetail(seriesId: seriesId, completion: { [weak self] response in
            
            guard let data = response.data else { return }
            
            self?.tvSeriesDetail = data
            
            self?.setupTvSeriesData()
        })
    }
    
    func setupTvSeriesData() {
        setupTvSeriesImage()
        setupTvSeriesTitle()
        setupTvSeriesDetail()
        setupTvSeriesPlot()
        setupTableView()
    }
    
    func setupTvSeriesImage() {
        guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(tvSeriesDetail?.poster_path ?? "")") else {
            return
        }
        
        tvSeriesImageView.kf.setImage(with: imageUrl)
    }
    
    func setupTvSeriesTitle() {
        let title: String? = tvSeriesDetail?.name ?? tvSeriesDetail?.original_name

        tvSeriesNameLabel.text = title ?? "-"
        tvSeriesNameLabel.font = .titleFont
        tvSeriesNameLabel.textColor = .titleColor
    }
    
    func setupTvSeriesDetail() {
        let tvSeriesDetailAttributed = NSMutableAttributedString()
        
        if let casts = credits?.cast, casts.count > 0 {
            tvSeriesDetailAttributed.append(NSAttributedString(string: "\(String.cast): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
            tvSeriesDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: casts.compactMap({$0.name}).joined(separator: ", ")))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        }
        

        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(String.genres): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: tvSeriesDetail?.genres?.compactMap({$0.name}).joined(separator: ", ")))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(String.language): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: tvSeriesDetail?.original_language))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(String.popularity): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: tvSeriesDetail?.popularity))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))

        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(String.firstAirDate): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: tvSeriesDetail?.first_air_date))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(String.numberOfSeasons): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: tvSeriesDetail?.number_of_seasons))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(String.numberOfEpisodes): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: tvSeriesDetail?.number_of_episodes))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(String.status): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: tvSeriesDetail?.status))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(String.voteCount): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        tvSeriesDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: tvSeriesDetail?.vote_count))", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        tvSeriesDetailLabel.attributedText = tvSeriesDetailAttributed
    }
    
    func setupTvSeriesPlot() {
        tvSeriesPlotLabel.text = tvSeriesDetail?.overview ?? "-"
        tvSeriesPlotLabel.font = .normalFont
        tvSeriesPlotLabel.textColor = .descriptionColor
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
    
    
    @IBAction func backButtonTapped() {
        dismiss(animated: true)
    }
}

extension TvSeriesDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        seasonTableView.delegate = self
        seasonTableView.dataSource = self
        seasonTableView.backgroundColor = .clear
        
        seasonTableView.register(UINib(nibName: SeasonCell.NibName, bundle: nil), forCellReuseIdentifier: SeasonCell.reuseIdentifier)
        
        if let seasons = tvSeriesDetail?.seasons {
            self.seasons = seasons
        }
        
        seasonTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let seasonCell = tableView.dequeueReusableCell(withIdentifier: SeasonCell.reuseIdentifier, for: indexPath) as? SeasonCell else {
            return UITableViewCell()
        }
        
        seasonCell.setData(season: seasons[indexPath.row])
        
        return seasonCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToSeasonDetail(seasonNumber: seasons[indexPath.row].season_number)
    }
    
    func goToSeasonDetail(seasonNumber: Int?) {
        let seasonDetailVC = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: Main.SeasonDetail.rawValue) as? SeasonDetailViewController ?? SeasonDetailViewController()
        
        seasonDetailVC.seriesId = seriesId
        seasonDetailVC.seasonNumber = seasonNumber
        seasonDetailVC.modalPresentationStyle = .fullScreen
        
        self.present(seasonDetailVC, animated: true)
    }
}
