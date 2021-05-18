//
//  ContentView.swift
//  notionintegration
//
//  Created by Maegan Wilson on 5/16/21.
//

import SwiftUI

struct ContentView: View {
    let notionAPI = NotionAPIService.shared
    
    var body: some View {
        Button("ADD DB"){
            print("ADD")
//            notionAPI.add(info: testPage, to: .pages) { (result: Result<NotionDB, NotionAPIService.NotionAPIServiceError>) in
//                switch result {
//                case.success(let results):
//                    print(results)
//                case .failure(let error):
//                    print(error)
//                }
//            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
