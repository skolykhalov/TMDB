//
//  DataManager.swift
//  TMDB
//
//  Created by Stas on 23.07.2022.
//

import Foundation
import RealmSwift

struct DataManager {
    
    let realm = try! Realm()
    
    static let shared = DataManager()
    
    private init() {}
    
    //MARK: - Saving to Realm
    
    func saveMoviesRealm(movie: MovieDetailsModel?, isSaved: Bool) {
        
        let savedMedia = MoviesRealmData()
        
        savedMedia.isSaved = isSaved
        savedMedia.id = movie?.id ?? 0
        savedMedia.mediaType = Constants.Network.movieType
        savedMedia.title = movie?.configureMediaTitle()
        savedMedia.overview = movie?.overview ?? Constants.DefaultValues.defaultString
        savedMedia.releaseLabelDate = movie?.configureMediaData() ?? Constants.DefaultValues.defaultString
        savedMedia.voteAverage = String(format: "%.1f", movie?.voteAverage ?? 0)
        savedMedia.posterPath = Constants.Network.baseImageURL + (movie?.posterPath ?? Constants.DefaultValues.defaultString)
        savedMedia.runTime = String(describing: movie?.configureMediaRuntime() ?? "")
        savedMedia.genre = movie?.configureMediaGenre().dropFirst().joined(separator: Constants.DefaultValues.defaultSeparator)
        
        do {
            try realm.write {
                realm.add(savedMedia, update: .modified)
                
            }
        } catch {
            print("Error saving movies \(error.localizedDescription)")
        }
    }
    
    
    //MARK: - Loading from Realm
    
    func loadMoviesRealm() -> [MoviesRealmData] {
        
        var movieResult: [MoviesRealmData] = []
        var moviesRealm: Results<MoviesRealmData>
        moviesRealm = realm.objects(MoviesRealmData.self)
        
        for movie in moviesRealm {
            movieResult.append(movie)
        }
        return movieResult
    }
    
    
    //MARK: - Deleting from Realm
    
    func deleteMoviesRealm(item: MoviesRealmData) {
        
        do {
            try realm.write {
                realm.delete(item)
            }
        } catch {
            print("Error saving movies \(error)")
        }
    }
    
    
    //MARK: - CheckMediaInRealm
    
    func checkMediaInRealm(realmDataList: [MoviesRealmData], media: MovieDetailsModel, completion: @escaping(()->())) {
        
        for item in realmDataList {
            
            if item.id == media.id {
                
                if item.isSaved == true {
                    
                    guard let idToDelete = media.id else { return }
                    
                    guard let itemToDelete = self.realm.objects(MoviesRealmData.self).where({ $0.id == idToDelete}).first else { return }
                    
                    DataManager.shared.deleteMoviesRealm(item: itemToDelete)
                    
                    completion()
                }
            }
        }
        
    }
    
    
}
