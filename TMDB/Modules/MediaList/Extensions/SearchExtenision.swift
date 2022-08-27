//
//  SearchExtenision.swift
//  TMDB
//
//  Created by Stas on 07.08.2022.
//

import Foundation
import UIKit

extension MediaListViewController: UISearchBarDelegate {
    
    //MARK: - ConfigureSearch
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.tableView.setContentOffset(.zero, animated: true)
        
        if searchBar.text?.count == 0 {
            
            mediaListViewModel.loadMediaData(Constants.Network.movieType) {
                self.tableView.reloadData()
            }
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            
        } else {
            
            let sortedText = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            
            let searchURL = NetworkManager().configureSearchMediaURL(mediaType: Constants.Network.movieType, text: sortedText ?? Constants.DefaultValues.defaultString)
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [self] (_) in
                
                NetworkManager().parceMediaData(url: searchURL) { (responceData: TrendingMediaModel) in
                    self.mediaListViewModel.mediaArray = responceData.results ?? []
                    self.tableView.reloadData()
                }
            })
        }
    }
    
    
    //MARK: - CancelButtonAction
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.tableView.setContentOffset(.zero, animated: true)
        mediaListViewModel.mediaArray.removeAll()
        
        mediaListViewModel.loadMediaData(Constants.Network.movieType) {
            self.tableView.reloadData()
        }
    }
   
    
    //MARK: - ConfigureScope
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        let scopeURL = NetworkManager().changingScopeURL(scope: searchBar.scopeButtonTitles?[selectedScope] ?? "Movie")
        
        NetworkManager().parceMediaData(url: scopeURL) { (responceData: TrendingMediaModel) in

            self.tableView.setContentOffset(.zero, animated: true)
            self.mediaListViewModel.mediaArray = responceData.results ?? []
            self.tableView.reloadData()
        }
    }
}
