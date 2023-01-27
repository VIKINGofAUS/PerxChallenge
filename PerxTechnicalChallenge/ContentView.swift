//
//  ContentView.swift
//  PerxTechnicalChallenge
//
//  Created by Tyson Langton-Weatherley on 25/1/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = .init()
    
    @State var selectedFDAResult: Results?
    
    var body: some View {
        VStack {
            TextField("Search Drugs", text: $viewModel.searchTerm)
                .autocorrectionDisabled()
                .padding()
                .accessibilityIdentifier("Search Drugs Text Field")
            
            ScrollView {
                ForEach(viewModel.fdaModel?.results ?? [], id: \.self) {result in
                    Group {
                        AbstractedResultView(hardCoreDrugs: result)
                            .frame(height: 100)
                        Divider()
                    }
                    .onTapGesture {
                        selectedFDAResult = result
                    }
                }
                if viewModel.fdaModel == nil {
                    Text("No Search Results")
                }
                    
            }
            .frame(maxWidth: .infinity)
            .accessibilityIdentifier("Search Results View")
        }
        .sheet(isPresented: Binding(get: {
            
            selectedFDAResult != nil

        }, set: {_ in
            
            selectedFDAResult = nil
            
        }), content: {
            DetailsPageView(hardCoreDrugs: $selectedFDAResult)
        })
        
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
