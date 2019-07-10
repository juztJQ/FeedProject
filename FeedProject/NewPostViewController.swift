//
//  NewPostViewController.swift
//  FeedProject
//
//  Created by Juanelo on 7/10/19.
//  Copyright © 2019 Juanelo. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var newPostText: UITextView!
    
    @IBOutlet weak var imageSelected: UIImageView!
    
    @IBOutlet weak var remainChar: UILabel!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newPostText.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhotoAction(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        remainChar.text = "\(textView.text.count)/150"
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
         textView.text = ""
    }
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return textView.text.count + (text.count - range.length) <= 150
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
