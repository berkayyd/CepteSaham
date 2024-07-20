//
//  FullScreenPhotoViewController.swift
//  CepteSaham
//
//  Created by Berkay Demir on 20.07.2024.
//

import UIKit

class FullScreenPhotoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    //Loading the View: IBOutlet properties like UIImageView are not set up until the view has been fully loaded. If you attempt to access them before viewDidLoad or similar lifecycle events, they might be nil
    var image: UIImage? {
       didSet {
           // Ensure imageView is connected before setting the image
           if isViewLoaded {
               imageView.image = image
           }
       }
   }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        if let image = image {
            imageView.image = image
        }
    }
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
