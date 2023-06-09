//
//  GitHubAPI.swift
//  MVC
//
//  Created by Kazunori Tsuchiya on 2023/06/06.
//

import Foundation

struct Data: Codable{
    var name: String
}

class GitHubAPI: ObservableObject{
    var DataArray = [String]()
    private let session = URLSession.shared

    func searchUser(username: String){
        self.DataArray = []
        guard let url = URL(string: "https://api.github.com/users/" + "\(username)" + "/repos") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "Get"
        
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            if error != nil{
                print("error")
            }
            
            if let response = response as? HTTPURLResponse {
                if !(200...299).contains(response.statusCode) {
                    print("Response status code does not indicate success: \(response.statusCode)")
                    return
                }
            }
            
            if let data = data{
                let decoder = JSONDecoder()
                guard let decodedResponse = try? decoder.decode([Data].self, from: data) else {print("Json decode error")
                        return
                    }
                decodedResponse.forEach { Data in
                    self.DataArray.append(Data.name)
                }
            }
        }.resume()
    }
}
