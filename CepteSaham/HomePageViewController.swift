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
                // Navigate to login screen after logout
                self.navigateToMain()
            case .failure(let error):
                print("Error signing out: \(error.localizedDescription)")
                // Optionally, show an alert or handle the error gracefully
            }
        }
    }
    
    private func navigateToMain() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let loginVC = storyboard.instantiateViewController(withIdentifier: "MainPageViewController") as? MainPageViewController {
                // Set login view controller as root to reset navigation stack
                UIApplication.shared.windows.first?.rootViewController = loginVC
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
        }
}
