//
//  TVCharacterDataModel.swift
//  Viewer
//
//  Created by Michael Little on 6/12/23.
//

import Foundation

struct TVCharacters: Codable {
    let Answer: String
    let Heading: String
    let ImageIsLogo: Int
    
    struct Meta: Codable {
        struct Developer: Codable {
            let type: String
            let name: String
            let url: String
        }
        
        let developer: [Developer]
        let perl_module: String
        let name: String
        let unsafe: Int
        let topic: [String]
        let description: String
        let js_callback_name: String
        let id: String
        let status: String
        let production_state: String
        let signal_from: String
        
        struct Maintainer: Codable {
            let github: String
        }
        
        let maintainer: Maintainer
        let src_name: String
        let dev_milestone: String
        let tab: String
        
        struct Src_Options: Codable {
            let source_skip: String
            let min_abstract_length: String
            let is_wikipedia: Int
            let skip_abstract_paren: Int
            let skip_qr: String
            let language: String
            let is_fanon: Int
            let skip_image_name: Int
            let skip_end: String
            let skip_abstract: Int
            let is_mediawiki: Int
            let skip_icon: Int
            let directory: String
            let src_info: String
        }
        
        let src_options: Src_Options
        let src_domain: String
        let example_query: String
        let src_id: Int
        let repo: String
    }
    
    let meta: Meta
    let DefinitionURL: String
    let Entity: String
    let Redirect: String
    let AnswerType: String
    let DefinitionSource: String
    let Infobox: String
    let AbstractText: String
    let Definition: String
    let AbstractURL: String
    let Image: String
    let Abstract: String
    let ImageHeight: Int
    let ImageWidth: Int
    struct Relatedtopics: Codable {
        let Text: String
        
        struct Icon: Codable {
            let Height: String
            let Width: String
            let URL: String
        }
        
        let Icon: Icon
        let FirstURL: String
        let Result: String
    }
    
    let RelatedTopics: [Relatedtopics]
    let AbstractSource: String
}

