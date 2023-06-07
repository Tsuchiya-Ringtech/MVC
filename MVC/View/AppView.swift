//
//  AppView.swift
//  MVC
//
//  Created by Kazunori Tsuchiya on 2023/06/06.
//

import SwiftUI
 
struct AppView: View {
    @State private var name = ""
    @ObservedObject var api = GitHubAPI()
    
    let fruits = ["Apple"]
    var body: some View {
        VStack{
            Spacer().frame(height: 20
            )
            Form{
                TextField("ユーザー名", text: $name)
            }.onChange(of: name){ _ in
                Controller(api: api, query: name).searchUser()
            }
            List {
                ForEach(0..<Controller(api: api, query: name).showDataArray().count, id: \.self){ index in
                    Text(Controller(api: api, query: name).showDataArray()[index])
                }
            }
        }
    }
}

/*struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}*/
