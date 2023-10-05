//
//  EpisodeListViewController.swift
//  StarWars
//
//  Created by Rodrigo Valladares on 13/6/23.
//

import UIKit
import Combine

enum CharacterTableViewSection {
    case main
}

class CharacterListViewController: UIViewController {

    // MARK: outlets properties
    @IBOutlet weak var characterTableView: UITableView!
    @IBOutlet weak var characterSpinner: UIActivityIndicatorView!
    
    // MARK: properties
    private lazy var characterViewModel = CharacterListViewModel(dependencies: CharacterListViewModelDependencies())
    private lazy var dataSource = UITableViewDiffableDataSource<CharacterTableViewSection, CharacterResponse>(tableView: characterTableView) { tableView, indexPath, character in
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterList") as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        cell.setCellInformation(character: character)
        
        return cell
    }

    private let search = UISearchController(searchResultsController: nil)
    
    private var characterSubscriber: AnyCancellable?
    private var characterList: [CharacterResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfiguration()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "characterDetail" else { return }
        
        guard let index = sender as? Int,
              let characterDetailController = segue.destination as? CharacterDetailViewController
        else {
            return
        }
        
        characterDetailController.characterDetail = characterList[index]
    }

    private func setConfiguration() {
        characterSpinner.startAnimating()
        setNavigationBarConfiguration()
        characterViewModel.setup()
        getData()
    }
    
    private func setNavigationBarConfiguration() {
        self.navigationItem.title = "Star Wars Characters"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.navigationItem.backButtonTitle = ""
    }
    
    private func getData() {
        characterSubscriber = characterViewModel.$characterList.sink(receiveValue: { [weak self] value in
            self?.characterList = value
            self?.update()
            self?.characterSpinner.stopAnimating()
            self?.characterSpinner.hidesWhenStopped = true
        })
    }
 
    private func update() {
        var snapshot = NSDiffableDataSourceSnapshot<CharacterTableViewSection, CharacterResponse>()
        
        snapshot.appendSections([.main])
        snapshot.appendItems(characterList)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
        
        performSegue(withIdentifier: "characterDetail", sender: selectedRow)
    }
}
