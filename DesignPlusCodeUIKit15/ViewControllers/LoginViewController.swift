//
//  LoginViewController.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 08/11/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginCard: CustomView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var primaryButton: UIButton!
    @IBOutlet weak var accessoryButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseInOut) {
            ///
            /// start the alpha for the logi card as 0 then set it here to 1 with delay to make it show up slowley
            ///
            self.loginCard.alpha = 1
            ///
            /// offsetBy() makes the card shows from bottom and goes up to its original frame in animation
            ///
            self.loginCard.frame = self.loginCard.frame.offsetBy(dx: 0, dy: -400)
        }

    }

}
