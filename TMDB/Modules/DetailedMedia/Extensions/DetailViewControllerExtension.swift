//
//  DetailViewControllerExtension.swift
//  TMDB
//
//  Created by Stas on 14.08.2022.
//

import UIKit

extension MediaDetailViewController {
    
    func configureMediaDataView() {

        detailTitleLabel.text = viewModel.media?.configureMediaTitle()

        self.detailRatingLabel.text = viewModel.media?.configureMediaRate()
        
        self.detailOverviewLabel.text = viewModel.media?.overview
        
        self.detailDateLabel.text = viewModel.media?.configureMediaData()
        self.infoReleaseDateLabel.text = viewModel.media?.configureMediaData()
        
        self.detailTimeLabel.text = viewModel.media?.configureMediaRuntime()
        
        self.loadPosterImage(imagePath: viewModel.media?.posterPath ?? Constants.DefaultValues.defaultString)
        
        self.detailGenreLabel.text = viewModel.media?.configureMediaGenre().first
        
        self.genreDescriptionLabel.text = viewModel.media?.configureMediaGenre().joined(separator: Constants.DefaultValues.defaultSeparator)

        self.infoCountryLabel.text = viewModel.media?.configureMediaCountry().joined(separator: Constants.DefaultValues.defaultSeparator)

        self.infoStudioNameLabel.text = viewModel.media?.configureMediaCompanies().joined(separator: Constants.DefaultValues.defaultSeparator)

        self.infoLanguageLabel.text = viewModel.media?.configureMediaLanguages().joined(separator: Constants.DefaultValues.defaultSeparator)
        
        for item in viewModel.realmDataList {
            
            if item.id == viewModel.media?.id {
                if item.isSaved == true {
                    self.saveButtonOutlet.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                } else if item.isSaved == false {
                    self.saveButtonOutlet.setImage(UIImage(systemName: "heart"), for: .normal)
                    
                }
            }
        }
        
    }
    
}
