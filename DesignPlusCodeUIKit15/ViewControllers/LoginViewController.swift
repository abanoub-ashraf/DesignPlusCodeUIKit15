//
//  LoginViewController.swift
//  DesignPlusCodeUIKit15
//
//  Created by Abanoub Ashraf on 08/11/2022.
//

import UIKit
import FirebaseAuth
import Combine

class LoginViewController: UIViewController {

    @IBOutlet weak var loginCard: CustomView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var primaryButton: UIButton!
    @IBOutlet weak var accessoryButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var emailIsEmpty = true
    private var passwordIsEmpty = true
    private var tokens: Set<AnyCancellable> = []
    
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
        
        emailTextField.publisher(for: \.text)
            .sink(receiveValue: { newValue in
                self.emailIsEmpty = (newValue == "" || newValue == nil)
            })
            .store(in: &tokens)
        
        passwordTextField.publisher(for: \.text)
            .sink(receiveValue: { newValue in
                self.passwordIsEmpty = (newValue == "" || newValue == nil)
            })
            .store(in: &tokens)

    }
    
    @IBAction func primaryButtonAction(_ sender: Any) {
        if emailIsEmpty || passwordIsEmpty {
            let alert = UIAlertController(
                title: "Missing Information!",
                message: "Please make sure to enter a valid Email address and a Password",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authResult, error in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                self.goToHomeScreen()
            }
        }
    }
    
    @IBAction func accessoryButtonAction(_ sender: Any) {
        //
    }
    
    private func goToHomeScreen() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarController") as! CustomTabBarController
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
}
