//
//  RestaurantDetailViewController.swift
//  LetsEat
//
//  Created by corey on 10/29/20.
//

import UIKit

class RestaurantDetailViewController: UITableViewController {
    
    var selectedRestaurant:RestaurantItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dump(selectedRestaurant as Any)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    

}
