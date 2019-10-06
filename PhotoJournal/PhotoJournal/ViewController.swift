//
//  ViewController.swift
//  PhotoJournal
//
//  Created by Kimball Yang on 9/27/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var photoJournals = [Journal](){
        didSet {
            self.photoCollection.reloadData()
        
        }
    }
    
    
    @IBOutlet weak var photoCollection: UICollectionView!
    
    
    @IBAction func optionClick(_ sender: Any) {
    }
    
    
    @IBAction func add(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let VC = storyboard.instantiateViewController(identifier: "editor") as? EditorViewController
            else {
                fatalError()
        }
        VC.modalPresentationStyle = .currentContext
        present(VC, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoJournals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell
            else {
                return UICollectionViewCell()
        }
        let myPhotos = photoJournals[indexPath.row]
        
        cell.caption.text = myPhotos.caption
        cell.date.text = myPhotos.timestamp
        cell.collectionImage.image = UIImage(data: myPhotos.imageData)
        
        return cell
    }
    
    

}
