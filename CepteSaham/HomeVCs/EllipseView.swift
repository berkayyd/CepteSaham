import UIKit

class EllipseView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }

        let ellipseLayer = CAShapeLayer()
        ellipseLayer.path = UIBezierPath(ovalIn: self.bounds).cgPath
        ellipseLayer.fillColor = UIColor.blue.cgColor
        
        self.layer.addSublayer(ellipseLayer)
    }
}
