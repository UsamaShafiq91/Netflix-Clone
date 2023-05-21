//
//  TvSeriesViewController.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 19/05/2023.
//

import Foundation
import UIKit

class TvSeriesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var categories: [Category] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        setupData()
    }

    func setupView() {
        view.backgroundColor = .backgroundColor
        
        setupTableView()
    }

    func setupData() {
        loadCategories()
    }
    
    func loadCategories() {
        let airingTodayCategory = Category(name: .airingToday, type: CategoryType.tvShow.rawValue, path: "/3/tv/airing_today")
        let onTheAirCategory = Category(name: .onTheAir, type: CategoryType.tvShow.rawValue, path: "/3/tv/on_the_air")
        let popularCategory = Category(name: .popular, type: CategoryType.tvShow.rawValue, path: "/3/tv/popular")
        let topRatedCategory = Category(name: .topRated, type: CategoryType.tvShow.rawValue, path: "/3/tv/top_rated")
        
        categories = [airingTodayCategory,
                      onTheAirCategory,
                      popularCategory,
                      topRatedCategory]
        
        tableView.reloadData()
    }
}

extension TvSeriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        tableView.register(UINib(nibName: TvCategoryRowCell.NibName, bundle: nil), forCellReuseIdentifier: TvCategoryRowCell.reuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoryRowCell = tableView.dequeueReusableCell(withIdentifier: TvCategoryRowCell.reuseIdentifier, for: indexPath) as? TvCategoryRowCell else {
            return UITableViewCell()
        }
        
        categoryRowCell.setData(category: categories[indexPath.row])
        categoryRowCell.itemSelectionProtocol = self
        
        return categoryRowCell
    }
}

extension TvSeriesViewController: ItemSelectionProtocol {
    
    func selectedItem(id: Int?, type: String) {
        let movieDetailVC = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: Main.TvSeriesDetail.rawValue) as? TvSeriesDetailViewController ?? TvSeriesDetailViewController()
        
        movieDetailVC.seriesId = id
        movieDetailVC.modalPresentationStyle = .fullScreen
        
        self.present(movieDetailVC, animated: true)
    }

}
