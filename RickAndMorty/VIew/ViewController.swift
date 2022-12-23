//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Kirill Karpovich on 21.12.22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate {
    
    var cards = [Card]()
    let networkManager = NetworkManager()
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

        networkManager.getData { response in
            DispatchQueue.main.async { [weak self] in
                self?.cards = response
                self?.collectionView.reloadData()
            }
        }
        
        title = "Rick and Morty"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.systemGreen
    
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        navigationController?.delegate = self

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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController else { return }

        let cell = collectionView.cellForItem(at: indexPath) as? PictureViewCell
        
        let image = cell?.imageView.image
        let name = cell?.name.text
        let status = cell?.status
        vc.image = image
        vc.name = name
        vc.status = status

        navigationController?.pushViewController(vc, animated: true)
    }

}
