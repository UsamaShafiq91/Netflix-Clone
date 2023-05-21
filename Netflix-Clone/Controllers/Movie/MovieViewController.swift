//
//  HomeViewController.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 30/04/2023.
//

import UIKit

class MovieViewController: UIViewController {
    
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
        let nowPlayingCategory = Category(name: .nowPlaying, type: CategoryType.movie.rawValue, path: "/3/movie/now_playing")
        let popularCategory = Category(name: .popular, type: CategoryType.movie.rawValue, path: "/3/movie/popular")
        let topRatedCategory = Category(name: .topRated, type: CategoryType.movie.rawValue, path: "/3/movie/top_rated")
        let upcomingCategory = Category(name: .upcoming, type: CategoryType.movie.rawValue, path: "/3/movie/upcoming")
        
        categories = [nowPlayingCategory,
                      popularCategory,
                      topRatedCategory,
                      upcomingCategory]
        
        tableView.reloadData()
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        tableView.register(UINib(nibName: MovieCategoryRowCell.NibName, bundle: nil), forCellReuseIdentifier: MovieCategoryRowCell.reuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let categoryRowCell = tableView.dequeueReusableCell(withIdentifier: MovieCategoryRowCell.reuseIdentifier, for: indexPath) as? MovieCategoryRowCell else {
            return UITableViewCell()
        }
        
        categoryRowCell.setData(category: categories[indexPath.row])
        categoryRowCell.itemSelectionProtocol = self
        
        return categoryRowCell
    }
}

extension MovieViewController: ItemSelectionProtocol {
    func selectedItem(id: Int?, type: String) {
        let movieDetailVC = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: Main.MovieDetail.rawValue) as? MovieDetailViewController ?? MovieDetailViewController()
        
        movieDetailVC.movieId = id
        movieDetailVC.modalPresentationStyle = .fullScreen
        
        self.present(movieDetailVC, animated: true)
    }

}
