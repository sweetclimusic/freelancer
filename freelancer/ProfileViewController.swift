//
//  ProfileViewController.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 11/02/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    var signoutAction: UIAction!
    override func viewDidLoad() {
        super.viewDidLoad()
        signoutAction = UIAction(
            title: "Sign out",
            image: UIImage(systemName: "lock.fill"),
            attributes: .destructive,
            handler: { [weak self] _ in
                self?.performSegue(withIdentifier: "signout", sender: self)
            })
        configureToolBar()
        configureProfileImage()
        // Do any additional setup after loading the view.
    }

    func configureToolBar() {
        // MARK: backButton
        let leftBarButton = UIButton()
        leftBarButton.setTitle(NSLocalizedString("Back", comment: ""), for: .normal)
        leftBarButton.setTitleColor(.black, for: .normal)
        leftBarButton.addAction(UIAction(
                                    handler: { [weak self] _ in
                                        self?.navigationController?.popViewController(animated: true)
                                    }),for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButton)

        // MARK: rightBarButton, build a UIMenu with a signout option
        let menu = UIMenu(title: "", children: [signoutAction])
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"),
            menu: menu)
        rightItem.tintColor = .black

        self.navigationItem.rightBarButtonItem = rightItem
    }

    func configureProfileImage() {
        // additional filtering
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
