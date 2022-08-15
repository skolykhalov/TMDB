//
//  MoviesData.swift
//  TMDB
//
//  Created by Stas on 18.07.2022.
//

import Foundation
import RealmSwift

class MoviesRealmData: Object {
    
    @objc dynamic var isSaved: Bool = false
    @objc dynamic var id: Int = 0
    @objc dynamic var mediaType: String = ""
    @objc dynamic var title: String? = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var releaseLabelDate: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var voteAverage: String? = ""
    @objc dynamic var runTime: String? = ""
    @objc dynamic var genre: String? = ""
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    
}
