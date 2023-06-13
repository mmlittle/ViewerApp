//
//  SceneDelegate.swift
//  Viewer
//
//  Created by Michael Little on 6/8/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard
            let splitViewController = window?.rootViewController as? UISplitViewController,
            let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
            let masterViewController = leftNavController.viewControllers.first as? MasterViewController,
            let detailViewController = splitViewController.viewControllers.last?.children.first as? DetailViewController
        else { fatalError() }
        
        let firstCharacter = masterViewController.tvCharacters?.RelatedTopics.first
        detailViewController.tvCharacter = firstCharacter
        masterViewController.delegate = detailViewController
    }
    
}

