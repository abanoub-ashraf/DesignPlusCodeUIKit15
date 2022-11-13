//
//  NotificationsViewController.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 11/11/2022.
//

import UIKit
import Combine
import FirebaseFirestore

class NotificationsViewController: UIViewController {

    @IBOutlet weak var cardView: CustomView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    private var tokens: Set<AnyCancellable> = []
    
    ///
    /// The object you use to manage data and provide cells for a table view.
    ///
    var dataSource: UITableViewDiffableDataSource<TBSection, NotificationModel>! = nil
    ///
    /// A representation of the state of the data in a view at a specific point in time.
    ///
    var currentSnapshot: NSDiffableDataSourceSnapshot<TBSection, NotificationModel>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView
            .publisher(for: \.contentSize)
            .sink(receiveValue: { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            })
            .store(in: &tokens)
        
        self.dataSource = UITableViewDiffableDataSource<TBSection, NotificationModel>(
            tableView: self.tableView,
            cellProvider: { (tableView: UITableView, indexPath: IndexPath, item: NotificationModel) -> NotificationTableViewCell in
                let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as? NotificationTableViewCell
                
                cell?.titleLabel.text = item.title
                cell?.messageLabel.text = item.message
                cell?.subtitleLabel.text = item.subtitle
                cell?.notificationImageView.image = UIImage(named: item.image)
                
                return cell ?? NotificationTableViewCell()
            }
        )
        
        self.dataSource.defaultRowAnimation = .fade
        
        ///
        /// A unit of asynchronous work.
        ///
        Task {
            do {
                ///
                /// this will try to asyncrounosly execute this function
                ///
                try await loadData()
            } catch let error {
                print("error: \(error.localizedDescription)")
            }
        }
    }
    
    ///
    /// async keyword convert the function into asyncronous function
    ///
    private func loadData() async throws {
        self.currentSnapshot = NSDiffableDataSourceSnapshot<TBSection, NotificationModel>()
        
        self.currentSnapshot.appendSections([.main])
        
        ///
        /// loads the documents from firebase collection
        ///
        let docs = try await Firestore.firestore().collection("notifications")
            .order(by: "sentAt", descending: false)
            .getDocuments()
        
        var notifications = [NotificationModel]()
        
        ///
        /// loop through the documents we got and decode them into my corresponding model
        ///
        for snapshot in docs.documents {
            let data = try snapshot.data(as: NotificationModel.self)
            notifications.append(data)
        }
        
        self.currentSnapshot.appendItems(notifications, toSection: .main)
        
        self.dataSource.apply(currentSnapshot, animatingDifferences: true, completion: nil)
        
        DispatchQueue.main.async {
            self.cardView.alpha = 1
        }
    }

}

extension NotificationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
