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
            
        // Use AuthService to log in the user
        AuthService.shared.loginUser(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                // Successfully logged in
                print("User logged in with email: \(user.email ?? "Unknown email")")
                self.navigateToHome()
            case .failure(let error):
                // Show error message
                self.showAlert(message: "Failed to log in: \(error.localizedDescription)")
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
}


