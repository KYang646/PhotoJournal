//
//  ViewController.swift
//  PhotoJournal
//
//  Created by Kimball Yang on 9/27/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var index = 0
    
    var photoJournals = [Journal](){
        didSet {
            self.photoCollection.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCollection.delegate = self
        photoCollection.dataSource = self
        loadJournal()
    }
    
    
    @IBOutlet weak var photoCollection: UICollectionView!
    
    
    @IBAction func optionButtonPressed(_ sender: UIButton) {
    
        print("\(index) is the index")
        let daAlert = UIAlertController(title: "Options", message: "Please select an option", preferredStyle: .actionSheet)
        
        let edit = UIAlertAction(title: "Edit", style: .default) {_ in
            
        }
        
        let delete = UIAlertAction(title: "Delete", style: .destructive) {_ in
            print("tag is \(sender.tag)")
            do{
                self.photoJournals =  try PhotoPersistenceManager.manager.deleteJournal(index: sender.tag)
            }catch{
                print("Can't delete")
            }
        }
        
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        daAlert.addAction(edit)
        daAlert.addAction(delete)
        daAlert.addAction(cancel)
        present(daAlert, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let VC = storyboard.instantiateViewController(identifier: "editor") as? EditorViewController
            else {
                fatalError()
        }
        VC.modalPresentationStyle = .currentContext
        present(VC, animated: true, completion: nil)
        
        
    }
    
    private func loadJournal(){
        do{
            photoJournals = try PhotoPersistenceManager.manager.getJournal()
        }catch{
            print(error)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadJournal()
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(photoJournals.count)
        return photoJournals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell
            else {
                return UICollectionViewCell()
        }
        let myPhotos = photoJournals[indexPath.row]
        index = indexPath.row
        print("The index is \(indexPath.row)")
        
        cell.caption.text = myPhotos.caption
        print(myPhotos.caption)
        cell.date.text = myPhotos.timestamp
        print(myPhotos.timestamp)
        print(myPhotos.id)
        print()
        cell.collectionImage.image = UIImage(data: myPhotos.imageData)
        
        cell.optionButtonOutlet.tag = indexPath.row
        
        return cell
    }
    
    
    
}
