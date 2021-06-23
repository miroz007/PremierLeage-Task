//
//  PostDetailView.swift
//  iOS-Viper-Architecture
//
//  Created by Amir Samir on 23/06/21.
//  
//

import UIKit
import SVGKit

class PostDetailView: UIViewController {
    
    
    @IBOutlet weak var teamImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tlaLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var foundedLabel: UILabel!
    @IBOutlet weak var clubColorsLabel: UILabel!

    
    var presenter: PostDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
           URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
       }
    
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                guard let self = self else {return}
                let anSVGImage: SVGKImage = SVGKImage(data: data)
                self.teamImageView.image = anSVGImage.uiImage
            }
        }
    }
    
}

extension PostDetailView: PostDetailViewProtocol {
    
    func showPostDetail(forPost post: PostModel) {
        nameLabel?.text = post.shortName
        tlaLabel?.text = "(\(post.tla))"
        stadiumLabel?.text = post.venue
        phoneLabel?.text = post.phone
        addressLabel?.text = post.address
        emailLabel?.text = post.email
        websiteLabel?.text = post.website
        foundedLabel?.text = "\(post.founded)"
        clubColorsLabel?.text = post.clubColors
        
        let url = URL(string: post.crestUrl)!
        downloadImage(from: url)

//
//        let placeholderImage = UIImage(named: "premier-league-logo")!
//        teamImageView?.af_setImage(withURL: url, placeholderImage: placeholderImage)
        

    }
    
}
