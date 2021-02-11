//
//  JobsCollectionViewController.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 10/02/2021.
//

import UIKit

class JobsCollectionViewController: UICollectionViewController {
    weak var userDataDelegate: UserDataReceivingDelegateProtocol?
    private var authorizedUserData: UserData?
    private var isLoggedIn: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension JobsCollectionViewController: UserDataReceivingDelegateProtocol {
    func userDataReceiver(userData: UserData) {
        self.authorizedUserData = userData
        isLoggedIn = true
    }
}
