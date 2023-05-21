//
//  CategoryRowCell.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 08/05/2023.
//

import Foundation
import UIKit

class MovieCategoryRowCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    var movieItemsService: MovieItemsService?
    var movies: [Movie] = []
    
    var currentPage = 1
    var isPageLoading = false
    
    var category: Category?
    
    var itemSelectionProtocol: ItemSelectionProtocol?
    
    override func awakeFromNib() {
        selectionStyle = .none
        backgroundColor = .clear
        
        categoryLabel.font = .titleFont
        
        setupCollectionView()
        setupService()
    }
    
    func setupService() {
        movieItemsService = MovieServiceAdapter()
    }
    
    func setData(category: Category) {
        self.category = category
        
        categoryLabel.text = category.name
        
        loadCategoryItems()
    }
    
    func loadCategoryItems() {
        guard !isPageLoading, let path = category?.path else { return }
        
        isPageLoading = true
        
        movieItemsService?.getMovieItems(path: path, page: currentPage, completion: { [weak self] response in
            
            self?.isPageLoading = false
            
            guard let data = response.data else { return }
            
            if let results = data.results {
                self?.movies.append(contentsOf: results)
            }
            
            if let _ = data.page {
                self?.currentPage = (self?.currentPage ?? 0) + 1
            }
            
            self?.itemsCollectionView.reloadData()
        })
    }
}

extension MovieCategoryRowCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView() {
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        itemsCollectionView.backgroundColor = .clear

        itemsCollectionView.register(UINib(nibName: ItemCell.NibName, bundle: nil), forCellWithReuseIdentifier: ItemCell.reuseIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.reuseIdentifier, for: indexPath) as? ItemCell else {
            return UICollectionViewCell()
        }
        
        itemCell.setData(itemImage: movies[indexPath.row].poster_path)
        
        if(indexPath.row == (movies.count - 1)) {
            loadCategoryItems()
        }
        
        return itemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        itemSelectionProtocol?.selectedItem(id: movies[indexPath.row].id, type: CategoryType.movie.rawValue)
    }
}
