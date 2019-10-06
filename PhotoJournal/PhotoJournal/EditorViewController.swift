//
//  EditorViewController.swift
//  PhotoJournal
//
//  Created by Kimball Yang on 10/6/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {
    
    private var imagePickerController: UIImagePickerController!
    
    @IBOutlet weak var eVCImage: UIImageView!
    
    @IBOutlet weak var eVCTextView: UITextView!
    
    @IBAction func eVCCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func eVCSave(_ sender: Any) {
    }
    
    @IBAction func eVCLibrary(_ sender: Any) {
         present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func eVCCamera(_ sender: Any) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
       
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

