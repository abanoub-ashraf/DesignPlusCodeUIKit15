//
//  FeaturedViewController.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 01/11/2022.
//

import UIKit
import Combine

class FeaturedViewController: UIViewController {

    // MARK: - UI

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var handbooksCollectionView: UICollectionView!
    @IBOutlet weak var coursesTableView: UITableView!
    @IBOutlet weak var coursesTableViewHeightConstraint: NSLayoutConstraint!
    
    ///
    /// this is for storing all of the listeners tha we create for combine
    ///
    private var tokens: Set<AnyCancellable> = []
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handbooksCollectionView.delegate = self
        handbooksCollectionView.dataSource = self
        handbooksCollectionView.layer.masksToBounds = false
        
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        coursesTableView.layer.masksToBounds = false
        
        ///
        /// - we wanna listen to any time the content size of the table view changes
        ///
        /// - the last content size the table view will have, we want it to be the height of that table view
        ///   instead of giving it a fixed number, and that's because we are iside scrollview and
        ///   that fixed number will mess it up
        ///
        coursesTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.coursesTableViewHeightConstraint.constant = newContentSize.height
            }
            .store(in: &tokens)
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

extension FeaturedViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesTableCell", for: indexPath) as! CoursesTableViewCell
        
        ///
        /// indexPath.section instead of indexPath.row cause each cell will be a separate section
        ///
        let course = courses[indexPath.section]
        
        cell.titleLabel.text = course.courseTitle
        cell.subtitleLabel.text = course.courseSubTitle
        cell.descriptionLabel.text = course.courseDescription
        cell.courseBackground.image = course.courseBackground
        cell.courseBanner.image = course.courseBanner
        cell.courseLogo.image = course.courseIcon
        
        return cell
    }
    
    ///
    /// this is gonna be the space between each cell because each cell will be a separate section
    ///
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
}
