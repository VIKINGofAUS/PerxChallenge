//
//  AbstractedResultView.swift
//  PerxTechnicalChallenge
//
//  Created by Tyson Langton-Weatherley on 26/1/2023.
//

import SwiftUI

struct AbstractedResultView: View {
    @State var hardCoreDrugs: Results?
    @State var showArrow: Bool = true
    var body: some View {
        HStack {
            VStack {
                Group {
                    
                    Text(hardCoreDrugs?.genericName ?? "Name")
                        .font(.title2)
                        .bold()
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                    Text(hardCoreDrugs?.brandName ?? "Brand Name")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding([.vertical], 5)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
                .opacity(showArrow ? 1 : 0)
                .accessibilityIdentifier("Abstracted View Chevron Nav")
            
        }
        .padding()
    }
}

struct AbstractedResultView_Previews: PreviewProvider {
    static var previews: some View {
        AbstractedResultView()
    }
}
