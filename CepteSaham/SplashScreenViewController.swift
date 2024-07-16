import UIKit
import FirebaseAuth

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var ballImageView: UIImageView!
    
    @IBOutlet weak var textImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackgroundImage()
        setupAnimatedImages()
    }

    private func setupBackgroundImage() {
        let backgroundImage = UIImage(named: "splashScreen")
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
                    self.transitionToNextViewController()
                }
            })
        }
    }
    
    private func transitionToNextViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var nextViewController: UIViewController

        if Auth.auth().currentUser != nil {
            nextViewController = storyboard.instantiateViewController(withIdentifier: "HomePageViewController")
        } else {
            nextViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")
        }

        nextViewController.modalTransitionStyle = .crossDissolve
        self.present(nextViewController, animated: true, completion: nil)
    }

}
