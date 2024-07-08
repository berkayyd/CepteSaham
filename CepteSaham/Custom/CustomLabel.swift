import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        // Custom font for the label
        font = UIFont(name: "BigShouldersDisplay-ExtraBold", size: 16)
        textColor = .darkGray
    }
}
