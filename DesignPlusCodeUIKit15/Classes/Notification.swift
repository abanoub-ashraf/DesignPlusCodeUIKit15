//
//  Notification.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 13/11/2022.
//

import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

enum TBSection: CaseIterable {
    case main
}

struct NotificationModel: Hashable, Codable {

    ///
    /// this will reference this id variable to the id of the document that we are currently loading from the firestore collection
    ///
    @DocumentID var id: String?
    var title: String!
    var message: String!
    var subtitle: String!
    var image: String!
    var sentAt: Timestamp!

}
