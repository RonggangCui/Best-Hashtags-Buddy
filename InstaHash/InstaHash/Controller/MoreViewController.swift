//
//  MoreViewController.swift
//  InstaHash
//
//  Created by Alex Cui on 2021-01-08.
//

import UIKit

class MoreViewController: UIViewController {
 
    @IBOutlet weak var shareLabel: UIButton!
    @IBOutlet weak var rateLabel: UIButton!
    @IBOutlet weak var websiteLabel: UIButton!
    
    let reviewService = ReviewService.shared
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func shareThisApp(_ sender: UIButton) {
        let activityVC = UIActivityViewController(activityItems: ["link of our app"], applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = self.view

        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    @IBAction func rateUs(_ sender: UIButton) {
        reviewService.requestReview()
    }
    
    @IBAction func ourWebsite(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.laptopsmartphonereview.com")!as URL, options: [:], completionHandler: nil)

    }
    
}
