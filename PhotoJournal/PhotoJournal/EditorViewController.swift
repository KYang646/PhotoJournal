//
//  EditorViewController.swift
//  PhotoJournal
//
//  Created by Kimball Yang on 10/6/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController {

    
    @IBOutlet weak var eVCImage: UIImageView!
    
    @IBOutlet weak var eVCTextView: UITextView!
    
    @IBAction func eVCCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func eVCSave(_ sender: Any) {
    }
    
    @IBAction func eVCLibrary(_ sender: Any) {
    }
    
    @IBAction func eVCCamera(_ sender: Any) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

    

}
