import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
        
    @IBOutlet weak var loginBtn: PrimaryButton!
    
    @IBOutlet weak var registerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background Image
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "backgroundImage.png")
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImageView, at: 0)
            
        forgotPasswordBtn.tintColor = UIColor(hex: "#4E9041")
        forgotPasswordBtn.titleLabel?.font = UIFont(name: "BigShouldersDisplay-ExtraBold", size: forgotPasswordBtn.titleLabel?.font.pointSize ?? UIFont.systemFontSize)
        forgotPasswordBtn.addTarget(self, action: #selector(forgotBtnTapped), for: .touchUpInside)
                
        containerView.backgroundColor = UIColor(hex: "#F6FFF5")
        
        loginBtn.layer.shadowColor = UIColor.black.cgColor
        loginBtn.layer.shadowOpacity = 0.5
        loginBtn.layer.shadowOffset = CGSize(width: 0, height: 2)
        loginBtn.layer.shadowRadius = 4
        loginBtn.layer.masksToBounds = false
        
        registerLabel.font = UIFont(name: "BigShouldersDisplay-Regular", size: 16)
        registerLabel.addRangeGesture(stringRange: "Kaydol") {
            self.navigateToRegister()
        }
        
        
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty else {
            // Show alert for empty email
            showAlert(message: "Please enter your email.")
            return
        }
            
        guard let password = passwordTextField.text, !password.isEmpty else {
            // Show alert for empty password
            showAlert(message: "Please enter your password.")
            return
        }
            
        // Use AuthService to log in the user
        AuthService.shared.loginUser(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                if user.isEmailVerified {
                    // Successfully logged in and email verified
                    print("User logged in with email: \(user.email ?? "Unknown email")")
                    navigateToTabBar()
                } else {
                    // Email not verified
                    self.showAlert(message: "Please verify your email before logging in.")
                }
            case .failure(let error):
                // Show error message
                self.showAlert(message: "Failed to log in: \(error.localizedDescription)")
            }
        }
    }
    
    @objc func forgotBtnTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let forgotVC = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController {
            self.present(forgotVC, animated: true)
        }
    }
        
    @objc private func navigateToRegister() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let registerVC = storyboard.instantiateViewController(withIdentifier:"RegisterViewController") as? RegisterViewController {
            var viewControllers = self.navigationController?.viewControllers
            viewControllers?.removeLast() // Remove the current LoginViewController
            viewControllers?.append(registerVC) // Add RegisterViewController
            self.navigationController?.setViewControllers(viewControllers!, animated: true)
        }
    }
    
    private func navigateToTabBar() {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        if let tabBarVC = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController {
            if let sceneDelegate = UIApplication.shared.connectedScenes
                .first?.delegate as? SceneDelegate, let window = sceneDelegate.window {
                window.rootViewController = tabBarVC
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
        }
    }

}


