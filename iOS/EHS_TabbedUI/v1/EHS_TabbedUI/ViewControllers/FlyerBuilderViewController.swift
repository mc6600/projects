//
//  FlyerBuilderViewController.swift
//  EHS_TabbedUI
//
//  Created by Ming Chen on 7/2/20.
//  Copyright © 2020 Ming Chen. All rights reserved.
//

import UIKit

class FlyerBuilderViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
      @IBOutlet weak var flyerTextEntry: UITextField!
      @IBOutlet weak var bodyTextView: UITextView!
      @IBOutlet weak var contactTextView: UITextView!
      @IBOutlet weak var imagePreview: UIImageView!
      
      override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add subtle outline around text views
        bodyTextView.layer.borderColor = UIColor.gray.cgColor
        bodyTextView.layer.borderWidth = 1.0
        bodyTextView.layer.cornerRadius = 4.0
        contactTextView.layer.borderColor = UIColor.gray.cgColor
        contactTextView.layer.borderWidth = 1.0
        contactTextView.layer.cornerRadius = 4.0
        
        // Add the share icon and action
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAction))
        self.toolbarItems?.append(shareButton)
        
        // Add responder for keyboards to dismiss when tap or drag outside of text fields
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: scrollView, action: #selector(UIView.endEditing(_:))))
        scrollView.keyboardDismissMode = .onDrag
      }
      
      @objc func shareAction() {
        print("Share icon touched.")
      }
      
      @IBAction func selectImageTouched(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Select Photo", message: "Where do you want to select a photo?", preferredStyle: .actionSheet)
        
        let photoAction = UIAlertAction(title: "Photos", style: .default) { (action) in
          if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            let photoPicker = UIImagePickerController()
            photoPicker.delegate = self
            photoPicker.sourceType = .photoLibrary
            photoPicker.allowsEditing = false
            
            self.present(photoPicker, animated: true, completion: nil)
          }
        }
        actionSheet.addAction(photoAction)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
          if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            cameraPicker.sourceType = .camera
            
            self.present(cameraPicker, animated: true, completion: nil)
          }
        }
        actionSheet.addAction(cameraAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true, completion: nil)
      }
    }

    extension FlyerBuilderViewController: UIImagePickerControllerDelegate {
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
          return
        }
        
        imagePreview.image = selectedImage
        imagePreview.isHidden = false
        
        dismiss(animated: true, completion: nil)
      }
    }

    extension FlyerBuilderViewController: UINavigationControllerDelegate {
      // Not used, but necessary for compilation
    }
