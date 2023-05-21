//
//  TvService.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 19/05/2023.
//

import Foundation

protocol TvSeriesItemsService {
    func getTvSeriesItems(path: String, page: Int, completion: @escaping(Response<TvSeriesResult>) -> Void)
}

protocol TvSeriesDetailService {
    func getTvSeriesDetail(seriesId: Int, completion: @escaping(Response<TvSeriesDetail>) -> Void)
    func getTvSeriesCredits(seriesId: Int, completion: @escaping(Response<Credits>) -> Void)
    func getTvSeriesVideos(seriesId: Int, completion: @escaping(Response<Videos>) -> Void)
    func getSeasonDetail(seriesId: Int, seasonNumber: Int, completion: @escaping(Response<SeasonDetail>) -> Void)
}
