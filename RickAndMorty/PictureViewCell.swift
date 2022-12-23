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
    
    var status = String()
    
    
    func configure(with card: Card) {
        name.text = card.name
        status = card.status
        
        
        let firstString = "First seen: "
        let lastString = "Last seen: "
        
        let attributedString = NSMutableAttributedString(string:card.origin.name)
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
        let boldString = NSMutableAttributedString(string: firstString, attributes:attrs)
        attributedString.insert(boldString, at: 0)
        firstSeen.attributedText = attributedString
        
        let attributedStringTwo = NSMutableAttributedString(string:card.location.name)
        let boldStringTwo = NSMutableAttributedString(string: lastString, attributes:attrs)
        attributedStringTwo.insert(boldStringTwo, at: 0)
        lastLocation.attributedText = attributedStringTwo

        
        self.imageView.layer.cornerRadius = 20
        self.imageView.layer.borderWidth = 2
        
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.masksToBounds = true
        
        
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
