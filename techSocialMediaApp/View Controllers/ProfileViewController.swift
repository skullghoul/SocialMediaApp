//
//  ProfileViewController.swift
//  techSocialMediaApp
//
//  Created by Zander Ewell on 2/2/23.
//

import UIKit

class ProfileViewController: UIViewController, UITabBarControllerDelegate {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    var profileUser = [ProfileUser]()
    var profile: ProfileUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameLabel.text = profile?.firstName
        
        getProfile()
        

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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tabBarController?.delegate = self
    }
    
    func getProfile() {
        Task {
            do {
                // Make the API Call
                let profileResponse = try await ProfileController().ProfileData(userUUID: User.current!.userUUID, userSecret: User.current!.secret)
                profileUser.append(contentsOf: profileResponse)
                self.navigationController?.setViewControllers(ViewController, animated: true)

                //                print(profileUser.count)
                
                
                //                print(posts[0].title)
            } catch {
                print("What the heck")
                print(error)
            }
        }
        
    }
    
    
}

