import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: CustomTextField!
    @IBOutlet weak var surnameTextField: CustomTextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var saveBtn: PrimaryButton!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    @IBOutlet weak var loginLabel: UILabel!
    
    private var authStateDidChangeHandle: AuthStateDidChangeListenerHandle?

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
            self.navigateToLogin()
        }

    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        
        guard let name = nameTextField.text, !name.isEmpty ,
        let surname = surnameTextField.text, !surname.isEmpty else {
            showAlert(message: "Please enter your name and surname")
            return
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlert(message: "Please enter your email.")
            return
        }
            
        guard let password = passwordTextField.text, !password.isEmpty, let passwordAgain = confirmPasswordTextField.text, !passwordAgain.isEmpty else {
            showAlert(message: "Please enter your password.")
            return
        }
        
        if passwordTextField.text != confirmPasswordTextField.text {
            showAlert(message: "Passwords should match")
            return
        }
            
        AuthService.shared.createUser(email: email, password: password) { [weak self] result in
            guard let self = self else { return }
                
            switch result {
            case .success(let user):
                print("User created successfully. Please check your email for verification.")
                self.sendVerificationEmail(to: user)
                navigateToLogin()
                
            case .failure(let error):
                self.showAlert(message: "Failed to create user: \(error.localizedDescription)")
            }
        }
    }
    
    private func sendVerificationEmail(to user: User) {
        user.sendEmailVerification { error in
            if let error = error {
                print("Error sending verification email: \(error.localizedDescription)")
            } else {
                self.showAlert(message: "Verification email sent to \(user.email ?? "user")")
            }
        }
    }


    @objc private func navigateToLogin() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            present(loginVC, animated: true, completion: nil)
        }
    }
    
    private func navigateToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = storyboard.instantiateViewController(withIdentifier: "HomePageViewController") as? HomePageViewController {
            present(homeVC, animated: true, completion: nil)
        }
    }
}
