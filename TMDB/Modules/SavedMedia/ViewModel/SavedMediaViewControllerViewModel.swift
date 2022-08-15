//
//  SavedMediaViewControllerViewModel.swift
//  TMDB
//
//  Created by Stas on 07.08.2022.
//

import Foundation


class SavedMediaViewControllerViewModel {
    
    var dataList: [MoviesRealmData] = []
    
    func loadSavedMedia() {
        
        dataList = DataManager.shared.loadMoviesRealm()
        
    }
}


