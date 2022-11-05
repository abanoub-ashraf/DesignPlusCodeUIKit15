//
//  CoursesViewController.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 05/11/2022.
//

import UIKit
import Combine

class CoursesViewController: UIViewController {

    @IBOutlet weak var sectionsTableView: UITableView!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var iconImageView: CustomImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuButton: UIButton!
    
    ///
    /// this is for storing all of the listeners tha we create for combine
    ///
    private var tokens: Set<AnyCancellable> = []
    
    var course: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        sectionsTableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        sectionsTableView.publisher(for: \.contentSize)
            .sink(receiveValue: { newContentSize in
                self.tableViewHeightConstraint.constant = newContentSize.height
            })
            .store(in: &tokens)
        
        self.iconImageView.image = course?.courseIcon
        self.bannerImage.image = course?.courseBanner
        self.backgroundImage.image = course?.courseBackground
        self.titleLabel.text = course?.courseTitle
        self.subtitleLabel.text = course?.courseSubTitle
        self.descriptionLabel.text = course?.courseDescription
        self.authorLabel.text = "Taught by \(course?.courseAuthors?.formatted(.list(type: .and, width: .standard)) ?? "Design+Code")"
        
        let menu = UIMenu(
            title: "Course Options",
            options: .displayInline,
            children: [
                UIAction(
                    title: "Share",
                    image: UIImage(systemName: "square.and.arrow.up"),
                    handler: { _ in
                        print("share course")
                    }
                ),
                UIAction(
                    title: "Take Test",
                    image: UIImage(systemName: "pencil"),
                    handler: { _ in
                        print("taake test")
                    }
                ),
                UIAction(
                    title: "Download",
                    image: UIImage(systemName: "arrow.down"),
                    handler: { _ in
                         print("download course")
                    }
                ),
                UIAction(
                    title: "Forums",
                    image: UIImage(systemName: "tray.fill"),
                    handler: { _ in
                         print("forums")
                    }
                )
            ]
        )
        
        ///
        /// attach the uimenu above to the button
        ///
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.menu = menu
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return course?.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell", for: indexPath) as! SectionTableViewCell
        
        if let selectdCourse = course, let sections = selectdCourse.sections {
            let selectedSection = sections[indexPath.row]
            
            cell.titleLabel.text = selectedSection.sectionTitle
            cell.courseLogo.image = selectedSection.sectionIcon
            cell.descriptionLabel.text = selectedSection.sectionDescription
            cell.subtitleLabel.text = selectedSection.sectionSubtitle
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
       
}
