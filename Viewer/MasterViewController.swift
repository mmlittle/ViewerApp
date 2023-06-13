//
//  MasterViewController.swift
//  Viewer
//
//  Created by Michael Little on 6/12/23.
//

import UIKit

protocol TVCharacterSelectionDelegate: AnyObject {
    func tvCharacterSelected(_ newCharacter: TVCharacters.Relatedtopics)
}

class MasterViewController: UITableViewController {

    weak var delegate: TVCharacterSelectionDelegate?

    var tvCharacters: TVCharacters?
    var relatedTopics:[TVCharacters.Relatedtopics]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            tvCharacters = await TVCharactersServiceImpl().fetchTVCharacters()
            relatedTopics = tvCharacters?.RelatedTopics
            print(tvCharacters?.Heading as Any)
            self.tableView.reloadData()
        }
    }

    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return relatedTopics?.count ?? 0
    }
    
    override func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var components = relatedTopics?[indexPath.row].Text.components(separatedBy: "- ")
        cell.textLabel?.text = components?.first
        return cell
    }

    override func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedCharacter = relatedTopics?[indexPath.row] {
            delegate?.tvCharacterSelected(selectedCharacter)
        }
        
        if let detailViewController = delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }

}
