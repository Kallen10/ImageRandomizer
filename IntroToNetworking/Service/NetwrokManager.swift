//
//  NetwrokManager.swift
//  IntroToNetworking
//
//  Created by Consultant on 11/9/22.
//

import Foundation

class NetworkManager {
    
    func fetchImageData(path: String, completion: @escaping
        (Data?) -> ()) {
        
        guard let url = URL(string: path) else {
            completion(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(nil)
                return
            }
            
            completion(data)
            
        }
        task.resume()
    }
    
}
