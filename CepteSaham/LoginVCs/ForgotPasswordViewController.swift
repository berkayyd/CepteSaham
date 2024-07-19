import UIKit
import FirebaseAuth

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
        
        Auth.auth().fetchSignInMethods(forEmail: email) { [weak self] signInMethods, error in
            if let error = error {
                self?.showAlert(message: "Hata: \(error.localizedDescription)")
                return
            }
            
            if let signInMethods = signInMethods, !signInMethods.isEmpty {
                Auth.auth().sendPasswordReset(withEmail: email) { error in
                    if let error = error {
                        self?.showAlert(message: "Hata: \(error.localizedDescription)")
                    } else {
                        self?.showAlert(message: "Şifre sıfırlama e-postası gönderildi.") {
                            self?.dismiss(animated: true)
                        }
                    }
                }
            } else {
                self?.showAlert(message: "Bu e-posta adresiyle kayıtlı bir kullanıcı bulunamadı.")
            }
        }
    }
    
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }

}
