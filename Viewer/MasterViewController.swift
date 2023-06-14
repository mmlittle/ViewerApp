//
//  MasterViewController.swift
//  Viewer
//
//  Created by Michael Little on 6/12/23.
//

import UIKit

protocol TVCharacterSelectionDelegate: AnyObject {
    func tvCharacterSelected(_ newCharacter: TVCharacters.Relatedtopics?)
}

class MasterViewController: UITableViewController, UISearchBarDelegate {

    weak var delegate: TVCharacterSelectionDelegate?

    struct TVCharactersStruct {
        var tvCharacters: String
        var tvCharacterTopic: TVCharacters.Relatedtopics
        var orgIndex: Int
    }
    
    var tvCharacters: TVCharacters?
    var tvCharacterTopics:[TVCharacters.Relatedtopics]?
    var tvCharacterArray:[TVCharactersStruct]?
    var tvCharacterArrayRestore:[TVCharactersStruct]?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            tvCharacters = await TVCharactersServiceImpl().fetchTVCharacters()
            tvCharacterTopics = tvCharacters?.RelatedTopics
            tvCharacterArray = []
            if let topics = tvCharacterTopics {
                var index: Int = 0
                for topic in topics {
                    let components = tvCharacters?.RelatedTopics[index].Text.components(separatedBy: "- ")
                    tvCharacterArray?.append(TVCharactersStruct(tvCharacters: components?.first ?? "",
                                                                tvCharacterTopic: topic,
                                                                orgIndex: index))
                    index += 1
                }
                tvCharacterArrayRestore = tvCharacterArray.map { $0 }
            }
            self.tableView.reloadData()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        searchBar.delegate = self
    }

    @objc func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debugPrint("searchText: \(searchText)")
        if !searchText.isEmpty {
            let result = tvCharacterArray?.filter( { $0.tvCharacters.hasPrefix(searchText) } )
            tvCharacterArray?.removeAll()
            tvCharacterArray = result
            tableView.reloadData()
        } else {
            tvCharacterArray = tvCharacterArrayRestore.map { $0 }
            tableView.reloadData()
        }
    }
    
    
    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tvCharacterArray?.count ?? 0
    }
    
    override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if tvCharacterArray?.count ?? 0 > 0 {
            cell.textLabel?.text = tvCharacterArray?[indexPath.row].tvCharacters
        }
        return cell
    }

    override func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedCharacterOrgIndex = tvCharacterArray?[indexPath.row].orgIndex {
            delegate?.tvCharacterSelected(tvCharacterTopics?[selectedCharacterOrgIndex])
        }
        if let detailViewController = delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }

}
