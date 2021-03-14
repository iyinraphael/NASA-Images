//
//  DetailViewModel.swift
//  NASA-Images
//
//  Created by Iyin Raphael on 3/13/21.
//

import UIKit.UIImage

class DetailViewModel {
    
    // MARK: - Property
    var title = BoxObservable(value: " ")
    var description = BoxObservable(value: " ")
    var photographer = BoxObservable(value: " ")
    var location = BoxObservable(value: " ")
    var image: BoxObservable<UIImage?> = BoxObservable(value: nil)
    var item: ItemAsset? {
        didSet {
            setItemProperties()
        }
    }
    
    init() {
    }
    
    // MARK: - Method
    private func setItemProperties() {
        let itemData = item?.data[0]
        
        image.value = getImage(from: item?.links[0].href)
        photographer.value = "Photographer: \(itemData?.photographer ?? " ")"
        location.value = "Location: \(itemData?.location ?? " ")"
        description.value = itemData?.description ?? " "
        title.value = itemData?.title ?? " "
    }
    
    private func getImage(from imageString: String?) -> UIImage {
        guard let imageWithString = imageString,
              let imageURL = URL(string: imageWithString),
              let data = try? Data(contentsOf: imageURL),
              let image = UIImage(data: data) else
        { return UIImage()}
        
        return image
    }
}
