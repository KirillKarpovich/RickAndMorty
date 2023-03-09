//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Kirill Karpovich on 23.12.22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageViewDetail: UIImageView!
    
    @IBOutlet var statusDetail: UILabel!
    
    @IBOutlet var nameDetail: UILabel!
    
    var image: UIImage?
    var name: String?
    var status: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageViewDetail.image = image
        nameDetail.text = name
        
        statusDetail.text = "Status: " + status
        switch status {
        case "Alive":
            statusDetail.textColor = .white
        case "Dead":
            statusDetail.textColor = .red
        default:
            statusDetail.textColor = .gray
        }

        imageViewDetail.layer.cornerRadius = 20
        imageViewDetail.layer.borderWidth = 2
    }
}
