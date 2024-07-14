//
//  ResetPasswordViewController.swift
//  CepteSaham
//
//  Created by Berkay Demir on 14.07.2024.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background Image
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "backgroundImage.png")
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImageView, at: 0)
        
        containerView.backgroundColor = UIColor(hex: "#F6FFF5")
    }

}
