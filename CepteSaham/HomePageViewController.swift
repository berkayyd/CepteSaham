//
//  HomePageViewController.swift
//  CepteSaham
//
//  Created by Berkay Demir on 9.07.2024.
//

import UIKit
import FirebaseAuth

class HomePageViewController: UIViewController {

    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutBtn.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }
    
    @objc private func logoutTapped() {
        // Use AuthService to logout the user
        AuthService.shared.logoutUser { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success:
                self.navigateToMain()
            case .failure(let error):
                print("Error signing out: \(error.localizedDescription)")
                showAlert(message: "Failed to log out: \(error.localizedDescription)")
            }
        }
    }
    
    private func navigateToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainVC = storyboard.instantiateViewController(withIdentifier: "MainPageViewController") as? MainPageViewController {
            
            UIApplication.shared.windows.first?.rootViewController = mainVC
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
}
