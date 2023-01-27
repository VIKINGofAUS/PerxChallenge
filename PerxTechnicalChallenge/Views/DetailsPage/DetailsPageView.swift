//
//  DetailsPageView.swift
//  PerxTechnicalChallenge
//
//  Created by Tyson Langton-Weatherley on 26/1/2023.
//

import SwiftUI

struct DetailsPageView: View {
    @Binding var hardCoreDrugs: Results?
    var body: some View {
//        ScrollView(content: {
        VStack {
            AbstractedResultView(hardCoreDrugs: hardCoreDrugs, showArrow: false)
            
            List {
                Section("Information", content: {
                    
                    genericDetailsView(header: "Brand Name", subDetails: hardCoreDrugs?.brandName ?? "")
                    genericDetailsView(header: "Listing Expirary Date", subDetails: hardCoreDrugs?.listingExpiraryDate ?? "")
                    
                    genericDetailsView(header: "Product NDC", subDetails: hardCoreDrugs?.productNDC ?? "")
                    genericDetailsView(header: "Generic Name", subDetails: hardCoreDrugs?.genericName ?? "")
                    genericDetailsView(header: "Labeler Name", subDetails: hardCoreDrugs?.labelerName ?? "")
                    genericDetailsView(header: "Brand Name", subDetails: hardCoreDrugs?.brandName ?? "")
                    genericDetailsView(header: "Dosage Form", subDetails: hardCoreDrugs?.dosageForm ?? "")
                    genericDetailsView(header: "Product Type", subDetails: hardCoreDrugs?.productType ?? "")
                })
                
                Section("Active Ingredients", content: {
                    ForEach(hardCoreDrugs?.activeIngredients ?? [], id: \.self) { ingredient in
                        genericDetailsView(header: ingredient.name ?? "", subDetails: ingredient.strength ?? "")
                    }
                })
                
                
                Section("Packaging", content: {
                    ForEach(hardCoreDrugs?.packaging ?? [], id: \.self) { packaging in
                        let subDetails = "Description: \(packaging.description ?? "") \n\nMarketing Start Date: \(packaging.marketingStartDate ?? "")\n\nSamples: \(packaging.sample ?? false)"
                        genericDetailsView(header: packaging.packageNDC ?? "", subDetails: subDetails)
                    }
                })
                
                
                Section("Route", content: {
                    ForEach(hardCoreDrugs?.route ?? [], id: \.self) {route in
                        Text(route)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                })
            }
        }
        .accessibilityIdentifier("Detail Page View")
            
//        })
    }
    
    @ViewBuilder
    func genericDetailsView(header: String, subDetails: String) -> some View {
        VStack {
            Group {
                Text(header)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(subDetails)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(5)
        }
        .padding(10)
    }
}

struct DetailsPageView_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailsPageView(hardCoreDrugs: .constant(nil))
       
    }
}
