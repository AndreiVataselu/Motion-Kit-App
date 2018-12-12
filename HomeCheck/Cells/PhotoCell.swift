//
//  PhotoCell.swift
//  HomeCheck
//
//  Created by Andrei Vataselu on 12/12/18.
//  Copyright © 2018 Andrei Vataselu. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var imageView : UIImageView!
    
    func configureCell(imageURL: String) {

        if let imageURL = URL(string: imageURL) {
            let downloader = ImageDownloader.default
            downloader.downloadImage(with: imageURL) { result in
                switch result {
                case .success(let value):
                    self.imageView.image = value.image
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
