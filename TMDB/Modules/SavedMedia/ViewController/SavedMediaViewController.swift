//
//  SavedMediaViewController.swift
//  TMDB
//
//  Created by Stas on 23.07.2022.
//

import UIKit

class SavedMediaViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = SavedMediaViewControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.loadSavedMedia()
        self.tableView.reloadData()
    }
    
    private func configureViewController() {
        
        let nib = UINib(nibName: Constants.UI.mediaCellName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constants.UI.mediaCellName)
    }
    
}


//MARK: - TableViewMethods

extension SavedMediaViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.UI.mediaCellName) as? MovieTableViewCell {
            
            cell.configureSavedMediaCell(media: viewModel.dataList[indexPath.row])
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            
            return cell
        }
        return UITableViewCell()
        
    }
    
}

extension SavedMediaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let movieDetailsVC = Constants.UI.storyboard.instantiateViewController(withIdentifier: Constants.UI.mediaDetailViewController) as? MediaDetailViewController {
            
            self.navigationController?.pushViewController(movieDetailsVC, animated: true)
            
            movieDetailsVC.mediaId = viewModel.dataList[indexPath.row].id
            Constants.Network.movieType = viewModel.dataList[indexPath.row].mediaType
            
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let itemToDelete = viewModel.dataList[indexPath.row]
            
            DataManager.shared.deleteMoviesRealm(item: itemToDelete)
            
            tableView.beginUpdates()
            
            viewModel.dataList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
    

}
