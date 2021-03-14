//
//  ViewModel.swift
//  NASA-Images
//
//  Created by Iyin Raphael on 3/13/21.
//

import Foundation

class ViewModel {
    
    // MARK: - Properties
    var items: BoxObservable<[ItemAsset]?> = BoxObservable(value: nil)
    let network = Network()
    
    init() {
        getItem()
    }
    
    // MARK: - Method
    func getItem() {
        network.getNasaAssets { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):
                self.items.value = items

            default:
                break
            }
        }
    }
    
    private func loadImage() {
        
    }
}
