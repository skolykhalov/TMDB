//
//  MovieDetailViewController.swift
//  TMDB
//
//  Created by Stas on 22.07.2022.
//

import UIKit
import SDWebImage
import youtube_ios_player_helper

class MediaDetailViewController: UIViewController {
    
    @IBOutlet weak var detailPosterImage: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var detailOverviewLabel: UILabel!
    @IBOutlet weak var detailGenreLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var overviewView: UIView!
    @IBOutlet weak var detailRatingLabel: UILabel!
    @IBOutlet weak var detailTimeLabel: UILabel!
    @IBOutlet weak var youtubePlayerView: YTPlayerView!
    @IBOutlet weak var genreDescriptionLabel: UILabel!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var infoStudioNameLabel: UILabel!
    @IBOutlet weak var infoReleaseDateLabel: UILabel!
    @IBOutlet weak var infoCountryLabel: UILabel!
    @IBOutlet weak var infoLanguageLabel: UILabel!
    
    let viewModel = MediaDetailViewControllerViewModel()
    var mediaId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadSavedMedia()
        
        viewModel.getMediaDetails(mediaId: mediaId) {
            self.configureMediaDataView()
        }
        
        viewModel.getMediaTrailer(mediaId: mediaId) {
            self.youtubePlayerView.load(withVideoId: self.viewModel.youtubeKey)
        }
        
        configureLayoutView()
    }
    
    
    //MARK: - ConfigureUI
    
    private func configureLayoutView() {
        titleView.layer.cornerRadius = 25
        overviewView.layer.cornerRadius = 25
        
    }
    
    
    //MARK: - AddMediaDataToView
    
    func loadPosterImage(imagePath: String) {
        
        guard let fullImageURL = URL(string: Constants.Network.baseImageURL + imagePath) else { return }
        detailPosterImage.sd_setImage(with: fullImageURL)
    }
    
    
    //MARK: - SaveButton Pressed
    
    @IBAction func saveMediaButtonPressed(_ sender: Any) {
        
        viewModel.loadSavedMedia()
        
        guard let media = viewModel.media else { return }
        
        DataManager.shared.checkMediaInRealm(realmDataList: viewModel.realmDataList, media: media) {
            
            let alert = UIAlertController(title: "Delete", message: "Delete from watch later list", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Delete", style: .default) { action in
                
                self.saveButtonOutlet.setImage(UIImage(systemName: "heart"), for: .normal)
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(action)
            alert.addAction(cancelAction)
            self.present(alert, animated: true)
            
        }
        
        let alert = UIAlertController(title: "Add", message: "Add to watch later list", preferredStyle: .alert)
        let action = UIAlertAction(title: "Save", style: .default) { action in
            
            DataManager.shared.saveMoviesRealm(movie: self.viewModel.media, isSaved: true)
            
            self.saveButtonOutlet.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
    
}


