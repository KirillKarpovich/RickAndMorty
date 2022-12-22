//
//  PictureViewCell.swift
//  RickAndMorty
//
//  Created by Kirill Karpovich on 21.12.22.
//

import UIKit

class PictureViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var name: UILabel!
    
    @IBOutlet var lastLocation: UILabel!
    
    @IBOutlet var firstSeen: UILabel!
    
    
    
    
    func configure(with card: Card) {
        name.text = card.name
        
        self.imageView.layer.cornerRadius = 20
        self.imageView.layer.borderWidth = 2
        
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true


        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect:bounds, cornerRadius:contentView.layer.cornerRadius).cgPath
        
        
        guard let url = URL(string: card.image) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading image: \(error)")
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
          
            DispatchQueue.main.async {
                self.imageView.image = image
            }
            
        }
        task.resume()
    }


}
