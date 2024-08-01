//
//  NotificationPageViewController.swift
//  CepteSaham
//
//  Created by Berkay Demir on 1.08.2024.
//

import UIKit

class NotificationPageViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
    }
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
