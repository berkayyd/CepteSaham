//
//  RegisterViewController.swift
//  CepteSaham
//
//  Created by Berkay Demir on 9.07.2024.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var saveBtn: PrimaryButton!
    
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Background Image
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "backgroundImage.png")
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImageView, at: 0)
        
        containerView.backgroundColor = UIColor(hex: "#F6FFF5")
        
        saveBtn.layer.shadowColor = UIColor.black.cgColor
        saveBtn.layer.shadowOpacity = 0.5
        saveBtn.layer.shadowOffset = CGSize(width: 0, height: 2)
        saveBtn.layer.shadowRadius = 4
        saveBtn.layer.masksToBounds = false
        
        loginLabel.font = UIFont(name: "BigShouldersDisplay-Regular", size: 16)
        loginLabel.addRangeGesture(stringRange: "Giriş Yap") {
            print("button tapped")
        }
    }
}
