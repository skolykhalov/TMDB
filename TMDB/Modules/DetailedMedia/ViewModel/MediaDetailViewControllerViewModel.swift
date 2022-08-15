//
//  MediaDetailViewControllerViewModel.swift
//  TMDB
//
//  Created by Stas on 07.08.2022.
//

import UIKit
import Alamofire

class MediaDetailViewControllerViewModel {
    
    var media: MovieDetailsModel?
    var realmDataList: [MoviesRealmData] = []
    var youtubeKey: String = ""
    var youtubeTrailerArray: [YoutubeTrailerResults] = []
    
    
    //MARK: - ParceDetailMediaInfo
    
    func getMediaDetails(mediaId: Int, completion: @escaping(()->())) {
        
        let detailsUrl = NetworkManager().configureDetailsUrl(mediaType: Constants.Network.movieType, mediaId: mediaId)
        
        NetworkManager().parceMediaData(url: detailsUrl) { (responceData: MovieDetailsModel) in
            
            self.media = responceData
            completion()
        }
        
    }

    
    //MARK: - ParceTrailer
    
    func getMediaTrailer(mediaId: Int, completion: @escaping(()->())) {
        
        let trailerURL = NetworkManager().configureTrailerURL(mediaType: Constants.Network.movieType, mediaId: mediaId)
        
        NetworkManager().parceMediaData(url: trailerURL) { (responceData: YoutubeTrailerModel) in
            
            self.youtubeTrailerArray = responceData.results ?? []
            self.youtubeKey = self.youtubeTrailerArray.last?.key ?? ""
            completion()
        }
    }
   
    
    //MARK: - LoadRealmData
    
    func loadSavedMedia() {
        
        realmDataList = DataManager.shared.loadMoviesRealm()
    }
    
}
