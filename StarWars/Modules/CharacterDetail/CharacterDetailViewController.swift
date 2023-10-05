//
//  EpisodeDetailViewController.swift
//  StarWars
//
//  Created by Rodrigo Valladares on 13/6/23.
//

import UIKit

enum CharacterDetailTableViewSection {
    case main
}

class CharacterDetailViewController: UIViewController {

    // MARK: - outlets variables
    @IBOutlet weak var characterDetailSpinner: UIActivityIndicatorView!
    @IBOutlet weak var characterDetailTableView: UITableView!
    
    // MARK: - variable
    private lazy var dataSource = UITableViewDiffableDataSource<CharacterDetailTableViewSection, CharacterResponse>(tableView: characterDetailTableView) { tableView, indexPath, character in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterDetail") as? CharacterDetailTableViewCell else {
            return UITableViewCell()
        }
        cell.setCellInformation(character: character)
        
        return cell
    }
    
    var characterDetail: CharacterResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setConfiguration()
    }
    
    private func setConfiguration() {
        characterDetailSpinner.startAnimating()
        setNavigationBarConfiguration()
        update()
    }
    
    private func setNavigationBarConfiguration() {
        self.navigationItem.title = characterDetail?.title ?? ""
    }
    
    private func update() {
        guard let character = characterDetail else { return }

        var snapshot = NSDiffableDataSourceSnapshot<CharacterDetailTableViewSection, CharacterResponse>()

        characterDetailSpinner.stopAnimating()
        characterDetailSpinner.hidesWhenStopped = true
        snapshot.appendSections([.main])
        snapshot.appendItems([character])
        dataSource.apply(snapshot, animatingDifferences: true)
    }

}
