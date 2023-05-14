//
//  HomeViewController.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 30/04/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
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
        let nowPlayingCategory = Category(name: "Now Playing", type: CategoryType.movie.rawValue, path: "/3/movie/now_playing")
        let popularCategory = Category(name: "Popular", type: CategoryType.movie.rawValue, path: "/3/movie/popular")
        let topRatedCategory = Category(name: "Top Rated", type: CategoryType.movie.rawValue, path: "/3/movie/top_rated")
        let upcomingCategory = Category(name: "Upcoming", type: CategoryType.movie.rawValue, path: "/3/movie/upcoming")
        
        categories = [nowPlayingCategory,
                      popularCategory,
                      topRatedCategory,
                      upcomingCategory]
        
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        tableView.register(UINib(nibName: CategoryRowCell.NibName, bundle: nil), forCellReuseIdentifier: CategoryRowCell.reuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoryRowCell = tableView.dequeueReusableCell(withIdentifier: CategoryRowCell.reuseIdentifier, for: indexPath) as? CategoryRowCell else {
            return UITableViewCell()
        }
        
        categoryRowCell.setData(category: categories[indexPath.row])
        categoryRowCell.itemSelectionProtocol = self
        
        return categoryRowCell
    }
}

extension HomeViewController: ItemSelectionProtocol {
    func selectedItem(item: Movie) {
        let movieDetailVC = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: Main.MovieDetail.rawValue) as? MovieDetailViewController ?? MovieDetailViewController()
        
        movieDetailVC.movie = item
        movieDetailVC.modalPresentationStyle = .fullScreen
        
        self.present(movieDetailVC, animated: true)
    }
}
