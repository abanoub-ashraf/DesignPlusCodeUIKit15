//
//  Course.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 04/11/2022.
//

import UIKit

class Course {
    
    var courseTitle: String
    var courseSubTitle: String
    var courseDescription: String
    var courseIcon: UIImage
    var courseBanner: UIImage
    var courseAuthors: [String]?
    var courseGradient: [CGColor]?
    var courseBackground: UIImage?
    var sections: [Section]?
    
    init(
        title: String!,
        subtitle: String!,
        description: String!,
        icon: UIImage!,
        banner: UIImage!,
        authors: [String]? = nil,
        colors: [CGColor]? = nil,
        background: UIImage? = nil,
        sections: [Section]
    ) {
        self.courseTitle = title
        self.courseSubTitle = subtitle
        self.courseDescription = description
        self.courseIcon = icon
        self.courseBanner = banner
        self.courseAuthors  = authors
        self.courseGradient = colors
        self.courseBackground = background
        self.sections = sections
    }
    
}

let handbooks = [
    Course(
        ///
        /// this is how to use localizable strings for different languages
        ///
        title: NSLocalizedString("SwiftUI Handbook", comment: "SwiftUI Handbook"),
        subtitle: NSLocalizedString("80 sections - 9 hours", comment: "80 sections - 9 hours"),
        description: "Build an iOS app for iOS 15 with custom layouts, animations and more!",
        icon: UIImage(named: "Logo SwiftUI")!,
        banner: UIImage(named: "Illustration 2")!,
        authors: ["Stephanie Diep"],
        colors: [
            UIColor(red: 0.387, green: 0.041, blue: 0.55, alpha: 1).cgColor,
            UIColor(red: 0.251, green: 0.555, blue: 0.835, alpha: 1).cgColor
        ],
        sections: sections
    ),
    Course(
        title: "React Hooks Handbook",
        subtitle: "30 sections - 3 hours",
        description: "A comprehensive series of tutorials on React Hooks and more!",
        icon: UIImage(named: "Logo React")!,
        banner: UIImage(named: "Illustration 4")!,
        authors: ["Meng To, Stephanie Diep"],
        colors: [
            UIColor(red: 0.51, green: 0.255, blue: 0.737, alpha: 1).cgColor,
            UIColor(red: 0.883, green: 0.283, blue: 0.523, alpha: 1).cgColor,
            UIColor(red: 0.984, green: 0.647, blue: 0.545, alpha: 1).cgColor
        ],
        sections: sections
    )
]

let courses = [
    Course(
        title: "SwiftUI Concurrency",
        subtitle: "NEW VIDEO",
        description: "Build an iOS app for iOS 15 with custom layouts, animations and more!",
        icon: UIImage(named: "Logo SwiftUI")!,
        banner: UIImage(named: "Illustration 4")!,
        authors: ["Meng To"],
        background: UIImage(named: "Background 3"),
        sections: sections
    ),
    Course(
        title: "Flutter for Designers",
        subtitle: "20 sections - 3 hours",
        description: "Build a Flutter app for iOS and Android with custom layouts, animations and more!",
        icon: UIImage(named: "Logo Flutter")!,
        banner: UIImage(named: "Illustration 1")!,
        authors: ["Sai Kambampati"],
        background: UIImage(named: "Background 4"),
        sections: sections
    ),
    Course(
        title: "React Hooks Advanced",
        subtitle: "20 sections - 3 hours",
        description: "Build a React app with custom layouts, animations and more!",
        icon: UIImage(named: "Logo React")!,
        banner: UIImage(named: "Illustration 2")!,
        authors: ["Meng To"],
        background: UIImage(named: "Background 5"),
        sections: sections
    )
]
