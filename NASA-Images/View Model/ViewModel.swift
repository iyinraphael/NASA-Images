//
//  ViewModel.swift
//  NASA-Images
//
//  Created by Iyin Raphael on 3/13/21.
//

import UIKit.UIImage

class ViewModel {
    
    // MARK: - Properties
    var items: BoxObservable<[ItemAsset]?> = BoxObservable(value: nil)
    let network = Network()
    
    init() {
        getItem()
    }
    
    // MARK: - Method
    private func getItem() {
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
    
    func paginate(count: Int) {
        if count == 5 {
            return
        }
        network.pageValue += count
        network.getNasaAssets { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let items):
                self.items.value?.append(contentsOf: items)

            default:
                break
            }
        }
    }
}
