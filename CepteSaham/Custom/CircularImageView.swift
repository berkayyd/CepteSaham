import UIKit

//@IBDesignable
class CircularImageView: UIImageView {

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }

    private func setupView() {
        layer.cornerRadius = self.frame.size.width / 2
        clipsToBounds = true
    }
}
