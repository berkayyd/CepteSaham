import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    
    var profileOptions: [ProfileOption] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the data source
        profileOptions = [
            ProfileOption(text: "History", imageName: "history-icon"),
            ProfileOption(text: "Personal Detailes", imageName: "personalDetailes-icon"),
            ProfileOption(text: "Location", imageName: "location-icon"),
            ProfileOption(text: "Payment Method", imageName: "payment-icon"),
            ProfileOption(text: "Settings", imageName: "settings-icon"),
            ProfileOption(text: "Help", imageName: "help-icon"),
            ProfileOption(text: "Logout", imageName: "logout-icon")
        ]
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableHeaderView = headerView
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
        
        let option = profileOptions[indexPath.row]
        cell.optionLabel.text = option.text
        cell.optionImageView.image = UIImage(named: option.imageName)
        
        if option.text == "Logout" {
            cell.toRightIcon.isHidden = true
        } else {
            cell.toRightIcon.isHidden = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let option = profileOptions[indexPath.row]
        if option.text == "Logout" {
            performLogout()
        }
    }
    
    func performLogout() {
        showAlert(message: "Çıkış yapmak istediğinize emin misiniz ?") {
            UIView.animate(withDuration: 0.3, animations: {
                self.view.alpha = 0.5
            }) { _ in
                // Call the logout method after the fade-out animation completes
                self.logoutTapped()
                print("Çıkış yapılıyor")
            }
        } cancelCompletion: {
            self.dismiss(animated: true)
        }

    }
    
    private func logoutTapped() {
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
            let navController = UINavigationController(rootViewController: mainVC)
            navController.navigationBar.tintColor = .white
            
            // Update the root view controller of the window
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = navController
                sceneDelegate.window?.makeKeyAndVisible()
            }
        }
    }
}
