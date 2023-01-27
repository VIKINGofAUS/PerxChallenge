//
//  ContentViewModel.swift
//  PerxTechnicalChallenge
//
//  Created by Tyson Langton-Weatherley on 25/1/2023.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var searchTerm: String = "" {
        didSet {
            fdaModel = nil
        }
    }
    
    @Published var fdaModel: FDADataModel? = nil
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        setupObservables()
    }
    
    func setupObservables() {
        // adding a debounce while typing can really ease up the amount of API calls sent while still keeping reactive.
        $searchTerm
            .filter({$0.count > 0})
            .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
            .sink(receiveValue: {[weak self] _ in
                debugPrint("Trigger after one second")
                self?.queryFDABrandSearch()
            })
            .store(in: &subscriptions)
    }
    
    private func queryFDABrandSearch() {
        OpenFDAAPIHelper().searchFDAWebsite(searchTerm: searchTerm, completion: {data in
            self.fdaModel = data
        })
    }
}
