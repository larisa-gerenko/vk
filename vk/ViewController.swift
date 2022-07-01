//
//  ViewController.swift
//  vkClient
//
//  Created by Larisa on 14.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var loginTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    let fromLogintoTabBarSegue = "fromLogintoTabBarSegue" // создаем константу для сеги

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - hide keyboard

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        self.view.addGestureRecognizer(tapRecognizer)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }


    @objc func onTap(){
        self.view.endEditing(true)
    }

    @objc func keyboardDidShow (_ notification: Notification) {

        let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        guard let keyboardHeight = keyboardSize?.height else {return}

        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }

    @objc func keyboardDidHide (_ notification: Notification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }

    //MARK: - Authentication
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let login = self.loginTextField.text,
              login == "root",
              let password = self.passwordTextField.text,
              password == "1234"
        else {print("error")
            return
        }

        performSegue(withIdentifier: fromLogintoTabBarSegue, sender: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

