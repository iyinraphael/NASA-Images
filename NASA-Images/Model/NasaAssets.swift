//
//  NasaAssets.swift
//  NASA-Images
//
//  Created by Iyin Raphael on 3/13/21.
//

import Foundation


struct NasaAssets: Codable {
    let collection: CollectionAsset
    
    struct CollectionAsset: Codable {
        let items: [ItemAsset]
        
        struct ItemAsset: Codable {
            let data: [DataAsset]
            let links: [LinkAsset]
            
            struct DataAsset: Codable {
                let title: String
                let photographer: String?
                let location: String?
                let description: String
            }
            struct LinkAsset: Codable {
                let href: String
            }
        }
    }
}


