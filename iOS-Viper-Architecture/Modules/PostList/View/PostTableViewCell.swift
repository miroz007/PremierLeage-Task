//
//  PostTableViewCell.swift
//  iOS-Viper-Architecture
//
//  Created by Amir Samir on 23/06/21.
//  
//

import UIKit
import SVGKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
           URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
       }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                guard let self = self else {return}
                let anSVGImage: SVGKImage = SVGKImage(data: data)
                self.postImageView.image = anSVGImage.uiImage
            }
        }
    }
    
    
    func set(forPost post: PostModel) {
        self.selectionStyle = .none
        titleLabel?.text = post.shortName
        let url = URL(string: post.crestUrl)!
        downloadImage(from: url)
    }
}
