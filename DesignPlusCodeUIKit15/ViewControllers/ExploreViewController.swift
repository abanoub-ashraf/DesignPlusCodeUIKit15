//
//  ExploreViewController.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 05/11/2022.
//

import UIKit
import Combine

class ExploreViewController: UIViewController {

    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    @IBOutlet weak var topicsTableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionsCollectionView.delegate = self
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.layer.masksToBounds = false
        
        topicsTableView.delegate = self
        topicsTableView.dataSource = self
        topicsTableView.layer.masksToBounds = false
        
        topicsTableView.publisher(for: \.contentSize)
            .sink(receiveValue: { newContentSize in
                self.tableViewHeightConstraint.constant = newContentSize.height
            })
            .store(in: &tokens)
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.layer.masksToBounds = false
    }

}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sectionsCollectionView {
            return sections.count
        } else {
            return handbooks.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sectionsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionsCollectionViewCell
            
            let section = sections[indexPath.item]
            
            cell.titleLabel.text = section.sectionTitle
            cell.subtitleLabel.text = section.sectionSubtitle
            cell.logo.image = section.sectionIcon
            cell.banner.image = section.sectionBanner
            
            return cell
        } else {
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
    
}

extension ExploreViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicsTableViewCell
        
        ///
        /// indexPath.section instead of indexPath.row cause each cell will be a separate section
        ///
        let topic = topics[indexPath.row]
        
        cell.topicLabel.text = topic.topicName
        cell.topicIcon.image = UIImage(systemName: topic.topicSymbol)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
