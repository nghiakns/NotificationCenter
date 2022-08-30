//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Kim Nghĩa on 30/08/2022.
//

import UIKit

let catNotificationKey = "cat"
let dogNotificationKey = "dog"

class ViewController: UIViewController {

    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    
    let cat = Notification.Name(rawValue: catNotificationKey)
    let dog = Notification.Name(rawValue: dogNotificationKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createObservers()
    }

    func createObservers() {
        //cat
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateAnimalImage(notification:)), name: cat, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateAnimalName(notification:)), name: cat, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: cat, object: nil)
        
        //dog
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateAnimalImage(notification:)), name: dog, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateAnimalName(notification:)), name: dog, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: dog, object: nil)
        
    }
    
    @objc func updateAnimalImage(notification: NSNotification){
        let isCat = notification.name == cat
        let image = isCat ? UIImage(named: "cat")! : UIImage(named: "dog")!
        animalImage.image = image
    }
    
    @objc func updateAnimalName(notification: NSNotification){
        let isCat = notification.name == cat
        let name = isCat ? "Your choice is cat" : "Your choice is dog"
        animalName.text = name
    }
    
    @objc func updateBackground(notification: NSNotification){
        let isCat = notification.name == cat
        let color = isCat ? UIColor.blue : UIColor.green
        view.backgroundColor = color
    }
    
    @IBAction func chooseAnimal(_ sender: Any) {
        let str = UIStoryboard.init(name: "Main", bundle: nil)
        let chooseVC = str.instantiateViewController(withIdentifier: "choose") as! ChooseViewController
        navigationController?.pushViewController(chooseVC, animated: true)
    }
    
}

