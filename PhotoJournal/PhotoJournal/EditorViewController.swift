//
//  EditorViewController.swift
//  PhotoJournal
//
//  Created by Kimball Yang on 10/6/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {
    
    var placeHolderText = ["Wubba lubba dub dub", "D'oh!", "It's XBox night", "How do you kill which has no life??"]
    
    var daPhoto: Journal?
    var index: Int?
    

    
    
    private var imagePickerController: UIImagePickerController!
    
    @IBOutlet weak var eVCImage: UIImageView!
    @IBOutlet weak var eVCTextView: UITextView!
    @IBAction func eVCCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func eVCSave(_ sender: Any) {
        let date = Date()
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withInternetDateTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timeStamp = isoDateFormatter.string(from: date)
        
        
        if let imageData = eVCImage.image?.jpegData(compressionQuality: 0.5){
//            let newPhoto = Journal.init(imageData: imageData, caption: eVCTextView.text, timestamp: timeStamp)
            let newPhoto = Journal.init(imageData: imageData, caption: eVCTextView.text, timestamp: timeStamp, id: Journal.getIdForNewJournal())

            if let _ = daPhoto{
               try? PhotoPersistenceManager.manager.editJournal(index: index!, editedJournal: newPhoto)
            }else{
                try? PhotoPersistenceManager.manager.saveJournal(journal: newPhoto)
            }
            
          
            dismiss(animated: true, completion: nil)
        }
        
        
        
    }
    
    @IBAction func eVCLibrary(_ sender: Any) {
         present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func eVCCamera(_ sender: Any) {
    }
    
    @IBOutlet weak var eVCCamera: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eVCTextView.delegate = self
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            eVCCamera.isEnabled = false
        }
        
        if let chosenPhoto = daPhoto{
            eVCImage.image = UIImage(data: chosenPhoto.imageData)
            eVCTextView.text = chosenPhoto.caption
            
        }
    }

}

extension EditorViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            eVCImage.image = selectedImage
        } else {
            print("No image found, NIL")
        }
        dismiss(animated: true, completion: nil)
    }
}



extension EditorViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        eVCTextView.text = ""
    }
    
    
}
