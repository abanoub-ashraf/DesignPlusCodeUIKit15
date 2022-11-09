//
//  LibraryViewController.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 09/11/2022.
//

import UIKit
import Combine

class LibraryViewController: UIViewController {

    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    @IBOutlet weak var topicsTableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var certificatesLabel: UILabel!
    
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
        
        ///
        /// accessiblity
        ///
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = UIFont.preferredFont(for: .title2, weight: .bold)
        titleLabel.maximumContentSizeCategory = .accessibilityExtraLarge
        
        certificatesLabel.adjustsFontForContentSizeCategory = true
        certificatesLabel.font = UIFont.preferredFont(for: .footnote, weight: .semibold)
        certificatesLabel.maximumContentSizeCategory = .accessibilityMedium
    }
    
}

extension LibraryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionCell", for: indexPath) as! SectionsCollectionViewCell
        
        let section = sections[indexPath.item]
        
        cell.titleLabel.text = section.sectionTitle
        cell.subtitleLabel.text = section.sectionSubtitle
        cell.logo.image = section.sectionIcon
        cell.banner.image = section.sectionBanner
        
        return cell
    }
    
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return librarySettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicCell", for: indexPath) as! TopicsTableViewCell
        
        ///
        /// indexPath.section instead of indexPath.row cause each cell will be a separate section
        ///
        let setting = librarySettings[indexPath.row]
        
        cell.topicLabel.text = setting.topicName
        cell.topicIcon.image = UIImage(systemName: setting.topicSymbol)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
