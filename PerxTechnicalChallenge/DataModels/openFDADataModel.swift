//
//  openFDADataModel.swift
//  PerxTechnicalChallenge
//
//  Created by Tyson Langton-Weatherley on 25/1/2023.
//

import Foundation

struct FDADataModel: Decodable, Equatable {
    var results: [Results]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.results = try container.decode([Results].self, forKey: .results)
        
    }
}

struct Error: Codable {
    var code: String
    var message: String
}


struct Results: Hashable, Codable {
    
    var productID: String?
    var productNDC: String?
    var genericName: String?
    var labelerName: String?
    var brandName: String?
    var activeIngredients: [ActiveIngredients]?
    var packaging: [Packaging]?
    var finished: Bool?
    var listingExpiraryDate: String?
    var marketingCategory: String?
    var dosageForm: String?
    var productType: String?
    var route: [String]?
    var pharmClass: [String]?
    
    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case productNDC = "product_ndc"
        case genericName = "generic_name"
        case labelerName = "labeler_name"
        case brandName = "brand_name"
        case activeIngredients = "active_ingredients"
        case packaging = "packaging"
        case finished = "finished"
        case listingExpiraryDate = "listing_expiration_date"
        case marketingCategory = "marketing_category"
        case dosageForm = "dosage_form"
        case productType = "product_type"
        case route = "route"
        case pharmClass = "pharm_class"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productID = try container.decode(String.self, forKey: .productID)
        self.productNDC = try container.decode(String.self, forKey: .productNDC)
        self.genericName = try container.decode(String.self, forKey: .genericName)
        self.labelerName = try container.decode(String.self, forKey: .labelerName)
        self.brandName = try container.decode(String.self, forKey: .brandName)
        self.activeIngredients = try container.decode([ActiveIngredients].self, forKey: .activeIngredients)
        self.packaging = try container.decode([Packaging].self, forKey: .packaging)
        self.finished = try container.decode(Bool.self, forKey: .finished)
        self.listingExpiraryDate = try container.decode(String.self, forKey: .listingExpiraryDate)
        self.marketingCategory = try container.decode(String.self, forKey: .marketingCategory)
        self.dosageForm = try container.decode(String.self, forKey: .dosageForm)
        self.productType = try container.decode(String.self, forKey: .productType)
        self.route = try container.decode([String].self, forKey: .route)
        self.pharmClass = try container.decode([String].self, forKey: .pharmClass)
    }
    
    static func == (lhs: Results, rhs: Results) -> Bool {
        if lhs.productNDC == rhs.productNDC {
            return true
        } else {
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(productNDC)
    }
}

struct ActiveIngredients: Codable, Hashable {
    var name: String?
    var strength: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case strength = "strength"
    }
}

struct Packaging: Codable, Hashable {
    var packageNDC: String?
    var description: String?
    var marketingStartDate: String?
    var sample: Bool?
    
    enum CodingKeys: String, CodingKey {
        case packageNDC = "package_ndc"
        case description = "description"
        case marketingStartDate = "marketing_start_date"
        case sample = "sample"
    }
    
}
