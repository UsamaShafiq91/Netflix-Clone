//
//  Router.swift
//  Netflix-Clone
//
//  Created by UsamaShafiq on 03/05/2023.
//

import Foundation
import Alamofire

enum EndPoint {
    case getMovieItems(path: String, page: Int)
    case getMovieDetail(movieId: Int)
    case getMovieCredits(movieId: Int)
    case getMovieVideos(movieId: Int)
    
    case getTvSeriesItems(path: String, page: Int)
    case getTvSeriesDetail(seriesId: Int)
    case getTvSeriesCredits(seriesId: Int)
    case getTvSeriesVideos(seriesId: Int)
    case getSeasonDetail(seriesId: Int, seasonNumber: Int)
}

struct Router: BaseRouter {
    
    let endpoint: EndPoint
    var token: String?
    var baseUrl: String = Constants.baseUrl
    
    init(endpoint: EndPoint, baseUrl: String = Constants.baseUrl) {
        self.endpoint = endpoint
        self.baseUrl = baseUrl
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.queryString
    }
    
    var path: String {
        switch endpoint {
        case .getMovieItems(let path, _): return path
        case .getMovieDetail(let movieId): return "/3/movie/\(movieId)"
        case .getMovieCredits(let movieId): return "/3/movie/\(movieId)/credits"
        case .getMovieVideos(let movieId): return "/3/movie/\(movieId)/videos"
            
        case .getTvSeriesItems(let path, _): return path
        case .getTvSeriesDetail(let seriesId): return "/3/tv/\(seriesId)"
        case .getTvSeriesCredits(let seriesId): return "/3/tv/\(seriesId)/credits"
        case .getTvSeriesVideos(let seriesId): return "/3/tv/\(seriesId)/videos"
        case .getSeasonDetail(let seriesId, let seasonNumber): return "/3/tv/\(seriesId)/season/\(seasonNumber)"
        }
    }
    
    var parameters: [String : AnyObject]? {
        switch endpoint {
        case .getMovieItems(_, let page):
            
            return [
                "page": page,
                "api_key": Constants.apiKey,
            ] as [String: AnyObject]
            
        case .getMovieDetail(_):

            return [
                "api_key": Constants.apiKey,
            ] as [String: AnyObject]
            
        case .getMovieCredits(_):

            return [
                "api_key": Constants.apiKey,
            ] as [String: AnyObject]
            
        case .getMovieVideos(_):

            return [
                "api_key": Constants.apiKey,
            ] as [String: AnyObject]
            
        case .getTvSeriesItems(_, let page):
            
            return [
                "page": page,
                "api_key": Constants.apiKey,
            ] as [String: AnyObject]
            
        case .getTvSeriesDetail(_):

            return [
                "api_key": Constants.apiKey,
            ] as [String: AnyObject]
            
        case .getTvSeriesCredits(_):

            return [
                "api_key": Constants.apiKey,
            ] as [String: AnyObject]
            
        case .getTvSeriesVideos(_):

            return [
                "api_key": Constants.apiKey,
            ] as [String: AnyObject]
            
        case .getSeasonDetail(_, _):

            return [
                "api_key": Constants.apiKey,
            ] as [String: AnyObject]
            
        default:
            return nil
        }
    }
    
    var file: Data? {
        return nil
    }
}
