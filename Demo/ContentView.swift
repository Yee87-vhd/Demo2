//
//  ContentView.swift
//  Demo
//
//  Created by 凌翊瀗 on 2022/1/19.
//

import SwiftUI

struct ContentView: View {
    
    @State private var resultElements = [ResultElement]()
    @State private var searchText = ""
    var searchResult: [ResultElement] {
        if searchText.isEmpty {
            return resultElements
        } else {
            return resultElements.filter {
                $0.地點.contains(searchText)
            }
        }
    }
    
    func test() {
        let urlString = "https://data.taipei/api/v1/dataset/bf3ca2c6-1608-4a70-af9e-e45cc43e3bc5?scope=resourceAquire"
        if let url = URL(string:urlString){
            URLSession.shared.dataTask(with: url){
                data,response,error in
                if let data=data {
                    
                    do {
                        let stole = try JSONDecoder().decode(Stole.self, from: data)
                        resultElements = stole.result.results
                        
                    } catch  {
                        print(error)
                    }
                }
            }.resume()
            print("task resume")
        }
        
    }
    
    func getImageName(resultElement: ResultElement) -> String {
        if resultElement.地點.contains("12") {
            return "dd"
        } else {
            return "ee"
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResult, id: \.id) { data in
                    VStack {
                        Image(getImageName(resultElement: data))
                        
                        Text(data.地點)
                    }
                }
            }
            .searchable(text: $searchText)
            .onAppear {
                test()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
