//
//  Image+Extensions.swift
//  StarWars
//
//  Created by Rodrigo Valladares on 16/6/23.
//

import UIKit
import Foundation

extension UIImageView {
    func downloadImage(at url: String) {
        guard let url = URL(string: url) else {
            self.image = UIImage(systemName: "f.circle")
            
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.image = UIImage(systemName: "f.circle")
                
                return
            }
            DispatchQueue.main.async() {
                let cacheData = CachedURLResponse(response: response!, data: data)
                URLCache.shared.storeCachedResponse(cacheData, for: request)
                guard let image = UIImage(data: data) else { return }
                self.image = image
            }
        }
        
        task.resume()
    }
}
