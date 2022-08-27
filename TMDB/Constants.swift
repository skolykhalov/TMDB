//
//  Constants.swift
//  TMDB
//
//  Created by Stas on 26.07.2022.
//

import Foundation
import UIKit

struct Constants {
    
    struct DefaultValues {
        static let defaultString = ""
        static let defaultSeparator = ", "
    }
    
    struct Colors {
        static let darkGrey = "TopicColor"
        static let customRed = "CustomRed"
    }
    
    struct Network {

        static let baseImageURL = "https://image.tmdb.org/t/p/w500"
        static var movieType = "movie"
        static var page = 1

    }
    
    struct UI {
        
        static let mediaCellName = String(describing: MovieTableViewCell.self)
        static let mediaDetailViewController = String(describing: MediaDetailViewController.self)
        static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    }

    
}
