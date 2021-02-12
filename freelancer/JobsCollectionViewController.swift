//
//  JobsCollectionViewController.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 10/02/2021.
//

import UIKit

class JobsCollectionViewController: UICollectionViewController {
    private var authorizedUserData: UserData?
    private var isLoggedIn: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Jobs", comment: "")
        // Do any additional setup after loading the view.
        configureToolBar()
    }
    // add the profile picture to the UINavigationToolbar
    func configureToolBar() {
        if isLoggedIn {
            if let profileImage = UIImage(named: "profile") {
                let profileView = UIAction(title: "") { [weak self] _ in
                        self?.performSegue(withIdentifier: "profile", sender: self)
                    }
                let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
                rightButton.addAction(profileView, for: .touchUpInside)

                // fill button content with a image and circl mask
                let profileImageView = UIImageView(image: profileImage)
                profileImageView.frame = rightButton.frame
                profileImageView.contentMode = .scaleAspectFill
                profileImageView.clipsToBounds = true
                profileImageView.layer.cornerRadius = 0.5 * profileImageView.bounds.width
                profileImageView.layer.masksToBounds = true
                rightButton.addSubview(profileImageView)

                self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
            }
        } else {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "person.crop.circle"),
                style: .plain,
                target: self,
                action: #selector(signin))
        }
    }
    @objc func signin() {
        self.performSegue(withIdentifier: "signin", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "profile" {
            return self.isLoggedIn
        } else {
            return true
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profile" {
            guard let profileVC = segue.destination as? ProfileViewController else { return }
            profileVC.profileData = authorizedUserData
        }
    }
}

extension JobsCollectionViewController {
    func setUserData(userData: UserData) {
        self.authorizedUserData = userData
        self.isLoggedIn = true
    }
}
