//
//  openFDAAPIHelper.swift
//  PerxTechnicalChallenge
//
//  Created by Tyson Langton-Weatherley on 25/1/2023.
//

import Foundation
class OpenFDAAPIHelper: ObservableObject {
    
    func searchFDAWebsite(searchTerm: String, completion:@escaping (FDADataModel) -> ()) {
        // This is an exact search term. so only one real result can come back.
        let urlString = "https://api.fda.gov/drug/ndc.json?search=brand_name=\(searchTerm)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid url... \n\(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data {
                
                guard let fdaDrugs = try? JSONDecoder().decode(FDADataModel.self, from: data) else {
                    return
                }
               
                
                print(fdaDrugs)
                
                DispatchQueue.main.async {
                    return completion(fdaDrugs)
                }
                
            }
        }.resume()
        
    }
}
