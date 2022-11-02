//
//  ViewController.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 01/11/2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.layer.cornerRadius = 30
        cardView.layer.cornerCurve = .continuous
        
        cardView.layer.shadowColor = UIColor(named: "Shadow")!.cgColor
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
        cardView.layer.shadowRadius = 20
        
        blurView.layer.cornerRadius = 30
        blurView.layer.cornerCurve = .continuous
        blurView.layer.masksToBounds = true
    }


}

