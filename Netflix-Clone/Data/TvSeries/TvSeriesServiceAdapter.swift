//
//  TvServiceAdapter.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 19/05/2023.
//

import Foundation
import Alamofire

struct TvSeriesServiceAdapter: TvSeriesItemsService, TvSeriesDetailService {
    
    let api: AlamofireApi
    
    init() {
        api = AlamofireApi()
    }
    
    func getTvSeriesItems(path: String, page: Int, completion: @escaping (Response<TvSeriesResult>) -> Void) {
        api.doRequest(router: Router(endpoint: .getMovieItems(path: path, page: page)), completion: completion)
    }
    
    func getTvSeriesDetail(seriesId: Int, completion: @escaping (Response<TvSeriesDetail>) -> Void) {
        api.doRequest(router: Router(endpoint: .getTvSeriesDetail(seriesId: seriesId)), completion: completion)
    }
    
    func getTvSeriesCredits(seriesId: Int, completion: @escaping(Response<Credits>) -> Void) {
        api.doRequest(router: Router(endpoint: .getTvSeriesCredits(seriesId: seriesId)), completion: completion)
    }
    
    func getTvSeriesVideos(seriesId: Int, completion: @escaping(Response<Videos>) -> Void) {
        api.doRequest(router: Router(endpoint: .getTvSeriesVideos(seriesId: seriesId)), completion: completion)
    }
    
    func getSeasonDetail(seriesId: Int, seasonNumber: Int, completion: @escaping(Response<SeasonDetail>) -> Void) {
        api.doRequest(router: Router(endpoint: .getSeasonDetail(seriesId: seriesId, seasonNumber: seasonNumber)), completion: completion)
    }
}

