//
//  MovieService.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 08/05/2023.
//

import Foundation


protocol MovieItemsService {
    func getMovieItems(path: String, page: Int, completion: @escaping(Response<MovieResult>) -> Void)
}

protocol MovieDetailService {
    func getMovieDetail(movieId: Int, completion: @escaping(Response<MovieDetail>) -> Void)
    func getMovieCredits(movieId: Int, completion: @escaping(Response<Credits>) -> Void)
    func getMovieVideos(movieId: Int, completion: @escaping(Response<Videos>) -> Void)
}
