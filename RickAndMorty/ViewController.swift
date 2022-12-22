//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Kirill Karpovich on 21.12.22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cards = [Card]()
    let networkManager = NetworkManager()
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkManager.getData { response in
            DispatchQueue.main.async { [weak self] in
                self?.cards = response
                self?.collectionView.reloadData()
            }
        }
        
        
        collectionView.dataSource = self
        collectionView.delegate = self


    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as? PictureViewCell else {
            fatalError("Unable to dequeue PersonCell")
        }
        
        let card = cards[indexPath.row]
        
        cell.configure(with: card)
        return cell
    }

}

