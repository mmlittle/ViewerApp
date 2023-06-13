//
//  DetailViewController.swift
//  Viewer
//
//  Created by Michael Little on 6/12/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var tvCharacter: TVCharacters.Relatedtopics? {
        didSet {
            refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func refreshUI() {
        loadViewIfNeeded()
        
        var components = tvCharacter?.Text.components(separatedBy: "- ")
        nameLabel.text = components?.first
        components?.remove(at: 0)
        textView.text = components?.joined()
    }
}

extension DetailViewController: TVCharacterSelectionDelegate {
    func tvCharacterSelected(_ newCharacter: TVCharacters.Relatedtopics) {
        tvCharacter = newCharacter
  }
}

