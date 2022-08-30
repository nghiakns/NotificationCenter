//
//  ChooseViewController.swift
//  NotificationCenter
//
//  Created by Kim Nghĩa on 30/08/2022.
//

import UIKit

class ChooseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func goToCat(_ sender: Any) {
        let name = Notification.Name(rawValue: catNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func goToDog(_ sender: Any) {
        let name = Notification.Name(rawValue: dogNotificationKey)
        NotificationCenter.default.post(name: name, object: nil)
        self.navigationController?.popToRootViewController(animated: true)
    }
}
