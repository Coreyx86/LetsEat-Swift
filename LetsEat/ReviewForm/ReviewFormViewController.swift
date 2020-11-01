//
//  ReviewFormViewController.swift
//  LetsEat
//
//  Created by corey on 11/1/20.
//

import UIKit

class ReviewFormViewController: UITableViewController {
    
    @IBOutlet weak var ratingView:RatingsView!
    @IBOutlet weak var tfTitle:UITextField!
    @IBOutlet weak var tfName:UITextField!
    @IBOutlet weak var tvReview:UITextView!
    
    @IBAction func onSaveTapped(_ sender: Any) {
        print(ratingView.rating)
        print(tfTitle.text as Any)
        print(tfName.text as Any)
        print(tvReview.text as Any)
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

}
