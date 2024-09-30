//
//  Extension.swift
//  QuotesApp
//
//  Created by Saranvignesh Soundararajan on 21/02/23.
//

import Foundation
import UIKit


// MARK: - Extension for fetching api image
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
       
        NetworkManager.shared.get(urlString: url.absoluteString) { [weak self] data,response,error  in
//            print("the dataa is \(data)")
//            print("the responsee is \(response) ")
            
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            
            
            
        }
        
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
