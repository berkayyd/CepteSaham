import UIKit

class MainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenHeight = UIScreen.main.bounds.height
        
        // Background Image
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "backgroundImage.png")
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImageView, at: 0)

        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Logo Image
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "ball.png")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
                
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: screenHeight * 0.18),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Welcome Label
        let welcomeLabel = UILabel()
        let welcomeText = "CepteSaham’a Hoşgeldiniz!"
        let attributedText = NSMutableAttributedString(string: welcomeText)
        attributedText.addAttribute(.foregroundColor, value: UIColor(hex: "#4B8966"), range: NSRange(location: 0, length: 12))
        attributedText.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 12, length: 13))
        welcomeLabel.attributedText = attributedText
        welcomeLabel.font = UIFont(name: "BigShouldersDisplay-ExtraBold", size: 32)
        welcomeLabel.textAlignment = .center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
                
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: screenHeight * 0.03),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Instruction Label
        let instructionLabel = UILabel()
        instructionLabel.text = "Devam etmek için bir giriş yöntemi seçiniz"
        instructionLabel.font = UIFont(name: "BigShouldersDisplay-Regular", size: 16)
        instructionLabel.textAlignment = .center
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(instructionLabel)
                
        NSLayoutConstraint.activate([
            instructionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: screenHeight * 0.02),
            instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Business Entry Button
        let businessButton = createButton(title: "İşletme Girişi", backgroundColor: UIColor(hex: "#154B2D"))
        businessButton.titleLabel?.font = UIFont(name: "BigShouldersDisplay-Bold", size: 17)
        businessButton.addTarget(self, action: #selector(navigateToLogin), for: .touchUpInside)
        view.addSubview(businessButton)
            
        NSLayoutConstraint.activate([
            businessButton.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: screenHeight * 0.03),
            businessButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            businessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            businessButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
               
        // User Entry Button
        let userButton = createButton(title: "Kullanıcı Girişi", backgroundColor: UIColor(hex: "#154B2D"))
        userButton.titleLabel?.font = UIFont(name: "BigShouldersDisplay-Bold", size: 17)
        view.addSubview(userButton)
            
        NSLayoutConstraint.activate([
            userButton.topAnchor.constraint(equalTo: businessButton.bottomAnchor, constant: screenHeight * 0.035),
            userButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
               
        // Guest Entry Button
        let guestButton = createButton(title: "Misafir Girişi", backgroundColor: UIColor(hex: "#4E9041"))
        guestButton.titleLabel?.font = UIFont(name: "BigShouldersDisplay-Bold", size: 17)
        view.addSubview(guestButton)
               
        NSLayoutConstraint.activate([
            guestButton.topAnchor.constraint(equalTo: userButton.bottomAnchor, constant: screenHeight * 0.035),
            guestButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            guestButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            guestButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
    }
    
    private func createButton(title: String, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc func navigateToLogin() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            navigationController?.pushViewController(loginVC, animated: true)
        }
    }


}
