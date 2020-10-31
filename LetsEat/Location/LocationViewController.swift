//
//  LocationViewController.swift
//  LetsEat
//
//  Created by corey on 10/28/20.
//

import UIKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let manager = LocationDataManager()
    
    var selectedCity:LocationItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}


// MARK: Private Extension
private extension LocationViewController {
    func initialize() {
        manager.fetch()
    }
}

// MARK: UITableViewDataSource
extension LocationViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = manager.locationItem(at: indexPath).full
        return cell
    }

}

// MARK: UITableViewDelegate
extension LocationViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            print("test select")
            cell.accessoryType = .checkmark
            selectedCity = manager.locationItem(at: indexPath)
            tableView.reloadData()
        }
        print("failed to init cell")
    }
}
