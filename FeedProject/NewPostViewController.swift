//
//  NewPostViewController.swift
//  FeedProject
//
//  Created by Juanelo on 7/10/19.
//  Copyright © 2019 Juanelo. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    @IBOutlet weak var newPostText: UITextView!
    
    @IBOutlet weak var imageSelected: UIImageView!
    
    @IBOutlet weak var remainChar: UILabel!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newPostText.delegate = self
        
        imagePicker.delegate = self
        let rightAddBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "Share", style: UIBarButtonItem.Style.plain, target: self, action: #selector(NewPostViewController.addTapped))
        self.navigationItem.setRightBarButtonItems([rightAddBarButtonItem], animated: true)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func addTapped (sender:UIButton) {
        shareContent()
    }
    
    func shareContent(){
        let text = newPostText.text
        let textShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textShare as [Any] , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func addPhotoAction(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = true
            
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
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        imageSelected.image = image
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


