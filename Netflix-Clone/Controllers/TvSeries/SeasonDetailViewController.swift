//
//  SeasonDetailViewController.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 21/05/2023.
//

import Foundation
import UIKit

class SeasonDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var epiosdeTableView: UITableView!
    
    var seriesId: Int?
    var seasonNumber: Int?
    var seasonDetailService: TvSeriesDetailService?
    var seasonDetail: SeasonDetail?
    var episodes: [Episode] = []
    
    override func viewDidLoad() {
        
        getSeasonData()
    }
    
    func getSeasonData() {
        seasonDetailService = TvSeriesServiceAdapter()
        
        getSeasonDetail()
    }
    
    func getSeasonDetail() {
        guard let seriesId = seriesId, let seasonNumber = seasonNumber else { return }
                
        seasonDetailService?.getSeasonDetail(seriesId: seriesId, seasonNumber: seasonNumber, completion: { [weak self] response in
            
            guard let data = response.data else { return }
            
            self?.seasonDetail = data
            
            self?.setupSeasonData()
        })
    }
    
    func setupSeasonData() {
        titleLabel.text = seasonDetail?.name
        
        setupTableView()
    }
    
    @IBAction func backButtonTapped() {
        dismiss(animated: true)
    }
}

extension SeasonDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        epiosdeTableView.delegate = self
        epiosdeTableView.dataSource = self
        epiosdeTableView.backgroundColor = .clear
        
        epiosdeTableView.register(UINib(nibName: EpisodeCell.NibName, bundle: nil), forCellReuseIdentifier: EpisodeCell.reuseIdentifier)
        
        if let episodes = seasonDetail?.episodes {
            self.episodes = episodes
        }
        
        epiosdeTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let episodeCell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.reuseIdentifier, for: indexPath) as? EpisodeCell else {
            return UITableViewCell()
        }
        
        episodeCell.setData(episode: episodes[indexPath.row])
        
        return episodeCell
    }
}

