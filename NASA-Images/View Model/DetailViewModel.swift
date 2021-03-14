//
//  DetailViewModel.swift
//  NASA-Images
//
//  Created by Iyin Raphael on 3/13/21.
//

import UIKit.UIImage

class DetailViewModel {
    
    init() {
        
    }
    
    func getImage(from imageString: String?) -> UIImage {
        guard let imageWithString = imageString,
              let imageURL = URL(string: imageWithString),
              let data = try? Data(contentsOf: imageURL),
              let image = UIImage(data: data) else
        { return UIImage()}
        
        return image
    }
}
