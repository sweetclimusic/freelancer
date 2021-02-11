//
//  ProfileViewController.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 11/02/2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureToolBar()
        // Do any additional setup after loading the view.
    }
    func configureToolBar() {
        let leftBarButton = LinkButton()
        leftBarButton.setTitle(NSLocalizedString("Back", comment: ""), for: .normal)
        leftBarButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButton)
        let rightItem = UIBarButtonItem.init(
            image: UIImage(systemName: "ellipsis"),
            style: .plain,
            target: self,
            action: nil)
        rightItem.tintColor = .black
        self.navigationItem.rightBarButtonItem = rightItem
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
