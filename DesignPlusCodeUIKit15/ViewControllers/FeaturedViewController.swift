//
//  FeaturedViewController.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 01/11/2022.
//

import UIKit

class FeaturedViewController: UIViewController {

    // MARK: - UI

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var handbooksCollectionView: UICollectionView!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handbooksCollectionView.delegate = self
        handbooksCollectionView.dataSource = self
        
        handbooksCollectionView.layer.masksToBounds = false
    }

}

extension FeaturedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return handbooks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionViewCell
        
        let handbook = handbooks[indexPath.item]
        
        cell.titleLabel.text = handbook.courseTitle
        cell.subtitleLabel.text = handbook.courseSubTitle
        cell.descriptionLabel.text = handbook.courseDescription
        cell.gradient.colors = handbook.courseGradient
        cell.logo.image = handbook.courseIcon
        cell.banner.image = handbook.courseBanner
        
        return cell
    }
    
}
