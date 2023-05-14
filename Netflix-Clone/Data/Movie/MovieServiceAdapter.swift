//
//  MovieServiceAdapter.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 08/05/2023.
//

import Foundation
import Alamofire

struct MovieServiceAdapter: MovieItemsService, MovieDetailService {
    
    let api: AlamofireApi
    
    init() {
        api = AlamofireApi()
    }
    
    func getMovieItems(path: String, page: Int, completion: @escaping (Response<MovieResult>) -> Void) {
        api.doRequest(router: Router(endpoint: .getMovieItems(path: path, page: page)), completion: completion)
    }
    
    func getMovieDetail(movieId: Int, completion: @escaping (Response<MovieDetail>) -> Void) {
        api.doRequest(router: Router(endpoint: .getMovieDetail(movieId: movieId)), completion: completion)
    }
    
    func getMovieCredits(movieId: Int, completion: @escaping(Response<Credits>) -> Void) {
        api.doRequest(router: Router(endpoint: .getMovieCredits(movieId: movieId)), completion: completion)
    }

    func getMovieVideos(movieId: Int, completion: @escaping (Response<Videos>) -> Void) {
        api.doRequest(router: Router(endpoint: .getMovieVideos(movieId: movieId)), completion: completion)
    }
}

