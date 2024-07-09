import UIKit

@IBDesignable
class PrimaryButton: UIButton {

    // MARK: - Inspectable Properties

    @IBInspectable var cornerRadius: CGFloat = 5 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var backgroundColorHex: String = "#154B2D" {
        didSet {
            self.backgroundColor = UIColor(hex: backgroundColorHex)
        }
    }

    @IBInspectable var titleColor: UIColor = .white {
        didSet {
            self.tintColor = titleColor
        }
    }

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = UIColor(hex: backgroundColorHex)
        self.tintColor = titleColor
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = UIFont(name: "BigShouldersDisplay-ExtraBold", size: 20)
    }
}
