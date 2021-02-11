//
//  LoginViewController.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 10/02/2021.
//
import Combine
import UIKit

class LoginViewController: UIViewController {

    var clientRequest: ClientRequest? = ClientRequest(decoder: JSONDecoder())
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: RoundedButtons!
    @IBOutlet var contentView: UIControl!
    private var activeTextField: UITextField?
    private var authorizedUser: UserData?

    var keyboardWillShowPublisher: AnyCancellable?
    var keyboardWillHidePublisher: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtUsername.delegate = self
        self.txtPassword.delegate = self
        // register targets
        contentView.addTarget(self, action: #selector(self.dismissKeyboard), for: .touchUpInside)
        btnLogin.addTarget(self, action: #selector(self.submitLogin), for: .touchUpInside)
        // Do any additional setup after loading the view.
        registerForKeyboardNotifications()
    }

    @objc func submitLogin(_ performSegue: Bool = false) {
        guard let request = clientRequest else { return }
        request.loginRequest(userData: ["johndoe", "password"], resultHandler: { [weak self] userData in
            self?.clientRequest?.session = ["username": "johndoe"]
            self?.authorizedUser = userData
            // submitLogin called programmatically
            if performSegue {
                DispatchQueue.main.async {
                    self?.performSegue(withIdentifier: "login", sender: self)
                }
            }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // skiped or logged in, navigate to jobs
        let destination = segue.destination as? JobsCollectionViewController
        // Pass the selected object to the new view controller.
        if authorizedUser != nil {
            destination?.userDataDelegate?.userDataReceiver(userData: authorizedUser!)
        }
    }

}
// MARK: Keyboard handling control functions
extension LoginViewController {
    func registerForKeyboardNotifications() {
        keyboardWillShowPublisher = NotificationCenter.default.publisher(
            for: LoginViewController.keyboardDidShowNotification )
            .sink( receiveValue: { value in
                guard let keyboardSize = (
                        value.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
                else {
                    // if keyboard size is not available for some reason, dont do anything
                    return
                }
                let keyboardTop = self.view.frame.height - keyboardSize.height
                // Calculate top keyboard and bottom activeField
                guard let activeTextField = self.activeTextField else { return }
                let txtFieldBottom = activeTextField.convert(activeTextField.bounds, to: self.view).maxY
                // move root view for keyboard if need
                if txtFieldBottom > keyboardTop {
                    // move content up half the size of the keyboard for a focus view
                    self.view.frame.origin.y = -(keyboardSize.height * 0.5)
                }
            })
        keyboardWillHidePublisher = NotificationCenter.default.publisher(
            for: LoginViewController.keyboardWillHideNotification )
            .sink { _ in
                self.view.frame.origin.y = 0
            }
    }

    @objc func dismissKeyboard() {
        view .endEditing(true)
    }

}

extension LoginViewController: UITextFieldDelegate {
    // capture textField Return to move to the next textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // user submitted via "go" return key
        if activeTextField == txtPassword {
            dismissKeyboard()
            submitLogin(true)
            return false
        }
        let nextTag = textField.tag + 1
        // jump to next textField in VC
        if let nextTextField = textField.superview?.viewWithTag(nextTag) {
                nextTextField.becomeFirstResponder()
        } else {
            resignFirstResponder()
        }
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
}
