//
//  LoginViewController.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 10/02/2021.
//

import UIKit

class LoginViewController: UIViewController {

    var clientRequest: ClientRequest? = ClientRequest(decoder: JSONDecoder())
    private var authorizedUser: UserData?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    func submitLogin() {
        guard let request = clientRequest else { return }
        request.loginRequest(userData: ["johndoe", "password"], resultHandler: { [weak self] userData in
            self?.clientRequest?.session = ["username": "johndoe"]
            self?.authorizedUser = userData
        })
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        // jump to next textField in VC
        if let nextTextField = textField.superview?.viewWithTag(nextTag) {
                nextTextField.becomeFirstResponder()
        } else {
            resignFirstResponder()
        }
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // skiped or logged in, navigate to jobs
        let destination = segue.destination as? JobsViewController
        // Pass the selected object to the new view controller.
        if authorizedUser != nil {
            destination?.userDataDelegate?.userDataReceiver(userData: authorizedUser!)
        }
    }
}

