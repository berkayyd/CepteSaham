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
        
        if Auth.auth().currentUser != nil {
            let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomePageViewController")
            self.present(homeViewController, animated: true)
        } else {
            let navigationController = storyboard.instantiateViewController(withIdentifier: "navController") as! UINavigationController
            let mainPageViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")
            navigationController.setViewControllers([mainPageViewController], animated: false)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true, completion: nil)
        }
    }

}
