//
//  HomePageViewController.swift
//  CepteSaham
//
//  Created by Berkay Demir on 9.07.2024.
//

import UIKit
import FirebaseAuth

class HomePageViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var profileViewContainer: UIView!
    
    let photos = ["pitch1", "pitch2", "pitch3"] // Fotoğraf adlarınız

    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.delegate = self
        collectionView.dataSource = self
        
        pageControl.numberOfPages = photos.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
    }
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        let page = sender.currentPage
        let indexPath = IndexPath(item: page, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
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

