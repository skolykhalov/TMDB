//
//  MovieTableViewCell.swift
//  TMDB
//
//  Created by Stas on 10.07.2022.
//

import UIKit
import SDWebImage

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var mediaNameLabel: UILabel!
    @IBOutlet weak var mediaDateLabel: UILabel!
    @IBOutlet weak var mediaOverviewLabel: UILabel!
    @IBOutlet weak var ratingMediaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(media: TrendingMediaResults) {

        mediaNameLabel.text = media.configureMediaTitle()
        mediaDateLabel.text = media.releaseDate
        mediaDateLabel.text = media.configureMediaData()
        ratingMediaLabel.text = media.configureMediaRate()
        mediaOverviewLabel.text = media.overview
        loadPosterImage(imagePath: media.posterPath ?? Constants.DefaultValues.defaultString)
        
    }
    
    func configureSavedMediaCell(media: MoviesRealmData) {
        
        mediaNameLabel.text = media.title
        mediaDateLabel.text = media.releaseLabelDate
        mediaOverviewLabel.text = media.overview
        ratingMediaLabel.text = media.voteAverage
        loadPosterImage(imagePath: media.posterPath)
        
    }
    
    func loadPosterImage(imagePath: String) {
        
        guard let fullImageURL = URL(string: Constants.Network.baseImageURL + imagePath) else { return }
        posterImageView.sd_setImage(with: fullImageURL)
    }
    

}
