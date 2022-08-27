//
//  ViewController.swift
//  TMDB
//
//  Created by Stas on 10.07.2022.
//

import UIKit

class MediaListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let searchController = UISearchController(searchResultsController: nil)
    var mediaListViewModel = MediaListViewControllerViewModel()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        
        setAppearanceViewController()
        
        mediaListViewModel.loadMediaData {
            self.tableView.reloadData()
        }
        
    }
    
    
    //MARK: - ConfigureUI
    
    private func configureViewController() {
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.showsScopeBar = true
        searchController.searchBar.scopeButtonTitles = ["Movie", "TV Shows"]
        
        let nib = UINib(nibName: Constants.UI.mediaCellName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constants.UI.mediaCellName)
    }
    
    private func setAppearanceViewController() {
        
        searchController.searchBar.backgroundColor = UIColor(named: Constants.Colors.darkGrey)
        
        let appearance = UINavigationBarAppearance(idiom: .phone)
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = UIColor(named: Constants.Colors.darkGrey)
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor(named: Constants.Colors.customRed)
        
        let placeholderAppearance = UILabel.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        placeholderAppearance.textColor = UIColor.white
        
        let searchTextAppearance = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        searchTextAppearance.textColor = UIColor.white
        
        searchController.searchBar.tintColor = UIColor.white
        
        searchController.searchBar.setScopeBarButtonTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: Constants.Colors.customRed)!], for: UIControl.State.normal)
    }
    
}


//MARK: - TableView DataSource Methods

extension MediaListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaListViewModel.mediaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.UI.mediaCellName) as? MovieTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(media: mediaListViewModel.mediaArray[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
        
    }
}


//MARK: - TableView Delegate Methods

extension MediaListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let movieDetailsVC = Constants.UI.storyboard.instantiateViewController(withIdentifier: Constants.UI.mediaDetailViewController) as? MediaDetailViewController {

            movieDetailsVC.mediaId = mediaListViewModel.mediaArray[indexPath.row].id ?? 0
            
            self.navigationController?.pushViewController(movieDetailsVC, animated: true)
        }

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == mediaListViewModel.mediaArray.count - 1 {
            
            Constants.Network.page += 1
            
            mediaListViewModel.loadMediaData(Constants.Network.movieType, Constants.Network.page) {
                self.tableView.reloadData()
            }
            
        }
    }
}
