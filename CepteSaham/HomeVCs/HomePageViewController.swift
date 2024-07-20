//
//  HomePageViewController.swift
//  CepteSaham
//
//  Created by Berkay Demir on 9.07.2024.
//

import UIKit
import FirebaseAuth

class HomePageViewController: UIViewController {

    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let photos = ["pitch1", "pitch2", "pitch3"] // Fotoğraf adlarınız

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pageControl.numberOfPages = photos.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        logoutBtn.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
    }
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        let page = sender.currentPage
        let indexPath = IndexPath(item: page, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func logoutTapped() {
        AuthService.shared.logoutUser { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success:
                self.navigateToMain()
            case .failure(let error):
                print("Error signing out: \(error.localizedDescription)")
                showAlert(message: "Failed to log out: \(error.localizedDescription)")
            }
        }
    }
    
    private func navigateToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let mainVC = storyboard.instantiateViewController(withIdentifier: "MainPageViewController") as? MainPageViewController {
            let navController = UINavigationController(rootViewController: mainVC)
            navController.navigationBar.tintColor = .white
            
            // Update the root view controller of the window
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = navController
                sceneDelegate.window?.makeKeyAndVisible()
            }
        }
    }
}
extension HomePageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! CampaignsCollectionViewCell
        cell.imageView.image = UIImage(named: photos[indexPath.item])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        cell.imageView.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = page
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        if let imageView = sender.view as? UIImageView {
            let point = collectionView.convert(imageView.center, from: imageView)
            if let indexPath = collectionView.indexPathForItem(at: point) {
                let photoName = photos[indexPath.item]
                if let image = UIImage(named: photoName) {
                    let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
                    if let fullScreenVC = storyboard.instantiateViewController(withIdentifier: "FullScreenPhotoViewController") as? FullScreenPhotoViewController {
                        fullScreenVC.modalPresentationStyle = .fullScreen
                        fullScreenVC.image = image // Set image directly
                        present(fullScreenVC, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}

