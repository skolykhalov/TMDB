//
//  MediaListViewControllerViewModel.swift
//  TMDB
//
//  Created by Stas on 07.08.2022.
//

import Foundation

class MediaListViewControllerViewModel {
    
    var mediaArray: [TrendingMediaResults] = []
   
    //MARK: - LoadingMediaData
    
    func loadMediaData(_ type: String = Constants.Network.movieType, completion: @escaping(()->())) {
        
        let url = NetworkManager().configureTrendingMediaURL(mediaType: Constants.Network.movieType)
        
        NetworkManager().parceMediaData(url: url) { (responceData: TrendingMediaModel) in
            self.mediaArray = responceData.results ?? []
            completion()
        }
    }
}
