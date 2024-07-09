import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
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
            print("button tapped")
        }
        
        loginBtn.addTarget(self, action: #selector(navigateToRegister), for: .touchUpInside)
        
    }
    
    @objc private func navigateToRegister() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let registerVC = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            present(registerVC, animated: true, completion: nil)
        }
    }
    
}


