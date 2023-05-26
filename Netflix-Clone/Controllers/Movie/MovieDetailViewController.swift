//
//  MovieDetailViewController.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 14/05/2023.
//

import Foundation
import UIKit
import WebKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDetailLabel: UILabel!
    @IBOutlet weak var moviePlotLabel: UILabel!
    @IBOutlet weak var trailerWebView: WKWebView!
    @IBOutlet weak var castCollectionView: UICollectionView!
    

    var movieId: Int?
    var movieDetailService: MovieDetailService?
    var movieDetail: MovieDetail?
    var credits: Credits?
    var videos: Videos?
    
    var casts: [Cast] = []

    override func viewDidLoad() {
        getMovieData()
    }
    
    func getMovieData() {
        movieDetailService = MovieServiceAdapter()
        
        getMovieCredits()
        getMovieVideos()
        getMovieDetail()
    }
    
    func getMovieCredits() {
        guard let movieId = movieId else { return }
        
        movieDetailService?.getMovieCredits(movieId: movieId, completion: { [weak self] response in
            
            guard let data = response.data else { return }
            
            self?.credits = data
            
            self?.setupMovieData()
        })
    }
    
    func getMovieVideos() {
        guard let movieId = movieId else { return }
        
        movieDetailService?.getMovieVideos(movieId: movieId, completion: { [weak self] response in
            
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
    
    func getMovieDetail() {
        guard let movieId = movieId else { return }
        
        movieDetailService?.getMovieDetail(movieId: movieId, completion: { [weak self] response in
            
            guard let data = response.data else { return }
            
            self?.movieDetail = data
            
            self?.setupMovieData()
        })
    }
    
    func setupMovieData() {
        setupMovieImage()
        setupMovieTitle()
        setupMovieDetail()
        setupMoviePlot()
        setupCollectionView()
    }
    
    func setupMovieImage() {
        guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(movieDetail?.poster_path ?? "")") else {
            return
        }
        
        movieImageView.kf.setImage(with: imageUrl)
    }
    
    func setupMovieTitle() {
        let title: String? = movieDetail?.title ?? movieDetail?.original_title

        movieNameLabel.text = title ?? "-"
        movieNameLabel.font = .titleFont
        movieNameLabel.textColor = .titleColor
    }
    
    func setupMovieDetail() {
        let movieDetailAttributed = NSMutableAttributedString()
        
        movieDetailAttributed.append(NSAttributedString(string: "\(String.budget): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        movieDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: movieDetail?.budget))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))

        movieDetailAttributed.append(NSAttributedString(string: "\(String.genres): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        movieDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: movieDetail?.genres?.compactMap({$0.name}).joined(separator: ", ")))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        movieDetailAttributed.append(NSAttributedString(string: "\(String.language): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        movieDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: movieDetail?.original_language))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        movieDetailAttributed.append(NSAttributedString(string: "\(String.popularity): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        movieDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: movieDetail?.popularity))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))

        movieDetailAttributed.append(NSAttributedString(string: "\(String.releaseDate): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        movieDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: movieDetail?.release_date))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        movieDetailAttributed.append(NSAttributedString(string: "\(String.revenue): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        movieDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: movieDetail?.revenue))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        movieDetailAttributed.append(NSAttributedString(string: "\(String.runtime): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        movieDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: movieDetail?.runtime))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        movieDetailAttributed.append(NSAttributedString(string: "\(String.status): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        movieDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: movieDetail?.status))\n", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        movieDetailAttributed.append(NSAttributedString(string: "\(String.voteCount): ", attributes: [.font: UIFont.keywordFont, .foregroundColor: UIColor.titleColor]))
        movieDetailAttributed.append(NSAttributedString(string: "\(getValidValue(value: movieDetail?.vote_count))", attributes: [.font: UIFont.normalFont, .foregroundColor: UIColor.descriptionColor]))
        
        movieDetailLabel.attributedText = movieDetailAttributed
    }
    
    func setupMoviePlot() {
        moviePlotLabel.text = movieDetail?.overview ?? "-"
        moviePlotLabel.font = .normalFont
        moviePlotLabel.textColor = .descriptionColor
    }
    
    func getValidValue(value: Any?) -> String {
        var validValue = "-"
        
        if let intValue = value as? Int64 {
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

extension MovieDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView() {
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.backgroundColor = .clear

        castCollectionView.register(UINib(nibName: CastCell.NibName, bundle: nil), forCellWithReuseIdentifier: CastCell.reuseIdentifier)
        
        if let casts = credits?.cast {
            self.casts = casts
        }
        
        castCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return casts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let castCell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCell.reuseIdentifier, for: indexPath) as? CastCell else {
            return UICollectionViewCell()
        }
        
        castCell.setData(cast: casts[indexPath.row])
        
        return castCell
    }
}
