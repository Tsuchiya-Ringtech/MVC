//
//  Controller.swift
//  MVC
//
//  Created by Kazunori Tsuchiya on 2023/06/06.
//

import Foundation

struct Controller {
    let api: GitHubAPI
    let query: String

    public func searchUser() {
        api.searchUser(username: query)
    }
    
    public func showDataArray() ->[String]{
        return api.DataArray
    }
}
