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
            
        // Call Firebase authentication to sign in with email and password
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
                
            if let error = error {
                // Show error message
                self.showAlert(message: "Failed to log in: \(error.localizedDescription)")
                return
            }
                
            // Successfully logged in
            if let user = authResult?.user {
                // Navigate to next screen or perform actions after login
                print("User logged in with email: \(user.email ?? "Unknown email")")
                // Example: Navigate to a home screen
                self.navigateToHome()
            }
        }
    }
        
    @objc private func navigateToRegister() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let registerVC = storyboard.instantiateViewController(withIdentifier:"RegisterViewController") as? RegisterViewController {
            present(registerVC, animated: true, completion: nil)
        }
    }
        
    private func navigateToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = storyboard.instantiateViewController(withIdentifier: "HomePageViewController") as? HomePageViewController {
            present(homeVC, animated: true, completion: nil)
        }
    }
        
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}


