//
//  UiImage+Extension.swift
//  OnePieceCoreDataProject
//
//  Created by Sadia on 14/6/23.
//


import Foundation
import UIKit
import Kingfisher

extension UIImageView{
    func setImage(with urlString: String ){
        guard let url = URL.init(string: urlString) else{
            return
        }
        let resource = ImageResource(downloadURL: url)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
