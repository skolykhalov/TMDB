//
//  NetworkManager.swift
//  TMDB
//
//  Created by Stas on 04.08.2022.
//

import Foundation
import Alamofire


struct NetworkManager {
    
    func parceMediaData<T: Decodable> (url: String, completion: @escaping(T) -> () ) {
        
        AF.request(url).responseJSON { responce in
            
            let decoder = JSONDecoder()

            do {
                if let safeData = responce.data {
                    let responceData = try! decoder.decode(T.self, from: safeData)
                    completion(responceData)
                }
            } 
        }
    }
    
    func configureTrendingMediaURL(mediaType: String, page: Int) -> String {
        let trendingMediaURL = "https://api.themoviedb.org/3/trending/\(mediaType)/week?api_key=fe835e5474ffc286d604ef0a61323f59&page=\(page)"
        
        return trendingMediaURL
    }
    
    func configureSearchMediaURL(mediaType: String, text: String) -> String {
        let searchMediaURL = "https://api.themoviedb.org/3/search/\(mediaType)?api_key=fe835e5474ffc286d604ef0a61323f59&language=en-US&query=\(text)&page=1&include_adult=false"
        return searchMediaURL
    }
    
    func configureDetailsUrl(mediaType: String, mediaId: Int) -> String {
        
        let detailsUrl = "https://api.themoviedb.org/3/\(mediaType)/\(mediaId)?api_key=fe835e5474ffc286d604ef0a61323f59&language=en-US"
        
        return detailsUrl
    }
    
    func configureTrailerURL(mediaType: String, mediaId: Int) -> String {
        
        let trailerURL = "https://api.themoviedb.org/3/\(mediaType)/\(mediaId)/videos?api_key=fe835e5474ffc286d604ef0a61323f59&language=en-US"
        
        return trailerURL
    }
    
    func changingScopeURL(scope: String) -> String {
        
        if scope == "Movie" {
            Constants.Network.movieType = "movie"
        } else if scope == "TV Shows" {
            Constants.Network.movieType = "tv"
        }

        let scopeURL = NetworkManager().configureTrendingMediaURL(mediaType: Constants.Network.movieType, page: 1)
        
        return scopeURL
    }

}
