import UIKit

extension UIViewController {
    func showAlert(
        message: String,
        completion: (() -> Void)? = nil,
        cancelCompletion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { _ in
            completion?()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            cancelCompletion?()
        }))
        
        present(alert, animated: true, completion: nil)
    }
}
