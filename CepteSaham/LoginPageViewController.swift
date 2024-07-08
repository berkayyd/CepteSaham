import UIKit

class LoginViewController: UIViewController {
    let loginLabel: UILabel = {
        let label = UILabel()
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "ball")
        
        let fontSize: CGFloat = 32
        let imageSize = CGSize(width: fontSize, height: fontSize)
        attachment.bounds = CGRect(x: 0, y: -(imageSize.height - fontSize) / 2, width: imageSize.width, height: imageSize.height)
        
        let attachmentString = NSAttributedString(attachment: attachment)
        let completeText = NSMutableAttributedString(string: "")
        completeText.append(attachmentString)
        
        let textString = NSAttributedString(string: " Giriş Yap ")
        completeText.append(textString)
        completeText.append(attachmentString)
        
        label.attributedText = completeText
        label.textAlignment = .center
        label.font = UIFont(name: "BigShouldersDisplay-ExtraBold", size: fontSize)
        
        return label
    }()

    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .none
        textField.backgroundColor = UIColor(hex: "#F3F9F2") // Background color
        textField.layer.borderColor = UIColor(hex: "#4E9041").cgColor // Border color
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        
        // Adding shadow for "level2" effect
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 2, height: 2)
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowRadius = 2
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Şifre"
        textField.borderStyle = .none
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor(hex: "#F3F9F2") // Background color
        textField.layer.borderColor = UIColor(hex: "#4E9041").cgColor // Border color
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true

        // Adding shadow for "level2" effect
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 2, height: 2)
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowRadius = 2
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Giriş Yap", for: .normal)
        button.backgroundColor = UIColor(hex: "#154B2D")
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Şifremi unuttum", for: .normal)
        button.tintColor = UIColor(hex: "#4E9041")
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Kaydol", for: .normal)
        button.tintColor = .green
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background Image
        let backgroundImageView = UIImageView()
        backgroundImageView.image = UIImage(named: "backgroundImage.png")
        backgroundImageView.contentMode = .scaleToFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(backgroundImageView, at: 0)
        
        setupUI()
    }
    
    private func setupUI() {
        // Create a stack view without the loginButton and registerButton
        let stackView = UIStackView(arrangedSubviews: [loginLabel, emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 16

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        // Add forgotPasswordButton and position it relative to the passwordTextField
        view.addSubview(forgotPasswordButton)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8).isActive = true
        forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true

        // Add loginButton separately and position it
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 16).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

        // Add registerButton separately and position it below the loginButton
        view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }


    
    @objc private func loginButtonTapped() {
        // Handle login logic here
    }
}


