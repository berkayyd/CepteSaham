import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    
    @IBOutlet weak var textImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackgroundImage()
        setupAnimatedImages()
    }

    private func setupBackgroundImage() {
        let backgroundImage = UIImage(named: "Brown Minimalist Pet Shop App Login Page Mobile Prototype-2 1-4")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = self.view.bounds
        self.view.addSubview(backgroundImageView)
    }

    private func setupAnimatedImages() {
        ballImageView.alpha = 0
        view.addSubview(ballImageView)
        textImageView.alpha = 0
        view.addSubview(textImageView)
        
        let delay: TimeInterval = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            UIView.animate(withDuration: 2.5, animations: {
                self.ballImageView.alpha = 1.0
                self.textImageView.alpha = 1.0
            }, completion: { _ in
                // Add delay before transitioning to the main app
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
                    mainViewController.modalTransitionStyle = .crossDissolve
                    self.present(mainViewController, animated: true, completion: nil)
                }
            })
        }
    }

}
