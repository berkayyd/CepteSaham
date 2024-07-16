import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
            
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetBtn: PrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background Image
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "backgroundImage.png")
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImageView, at: 0)
        
        containerView.backgroundColor = UIColor(hex: "#F6FFF5")
                
        cancelBtn.tintColor = UIColor(hex: "#4E9041")
        
        resetBtn.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)

    }
    
    @objc func resetButtonTapped() {
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlert(message: "Lütfen e-posta adresinizi girin.")
            return
        }
        
        AuthService.shared.resetPassword(email: email) { [weak self] result in
            switch result {
            case .success:
                self?.showAlert(message: "Şifre sıfırlama e-postası gönderildi.") {
                    self?.dismiss(animated: true, completion: nil)
                }
            case .failure(let error):
                self?.showAlert(message: "Hata: \(error.localizedDescription)")
            }
        }
    }
    
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            dismiss(animated: true, completion: nil)
        }
    }

}
