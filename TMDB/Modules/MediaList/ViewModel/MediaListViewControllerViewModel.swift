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

    func loadMediaData(_ type: String = Constants.Network.movieType, _ page: Int = 1, completion: @escaping(()->())) {
        
        let url = NetworkManager().configureTrendingMediaURL(mediaType: type, page: page)
        
        NetworkManager().parceMediaData(url: url) { (responceData: TrendingMediaModel) in
            
            let mediaList = responceData.results ?? []

            for media in mediaList {
                self.mediaArray.append(media)
            }

            completion()
        }
    }
}
