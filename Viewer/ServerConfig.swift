//
//  ServerConfig.swift
//  Viewer
//
//  Created by Mike Little on 6/14/23.
//

import Foundation

enum BaseURL: String {
        case SIMPSONS = "http://api.duckduckgo.com/?q=simpsons+characters&format=json"
        case THEWIRE = "http://api.duckduckgo.com/?q=the+wire+characters&format=json"
}

class ServerConfig {
    static let shared: ServerConfig = ServerConfig()
    
    var baseURL: String?
    
    func setupServerConfig() {
        #if SIMPSONS
        self.baseURL = BaseURL.SIMPSONS.rawValue
        #elseif THEWIRE
        self.baseURL = BaseURL.THEWIRE.rawValue
        #endif
    }
}
