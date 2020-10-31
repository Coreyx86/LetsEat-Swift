//
//  ExploreViewController.swift
//  LetsEat
//
//  Created by corey on 10/25/20.
//

import UIKit

class ExploreViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let manager = ExploreDataManager()
    var selectedCity:LocationItem?
    var headerView:ExploreHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
    
   

}


// MARK: Private Extension
private extension ExploreViewController {
    func initialize() {
        manager.fetch()
    }
    
    @IBAction func unwindLocationCancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindLocationDone(segue:UIStoryboardSegue) {
        if let viewController = segue.source as? LocationViewController {
            selectedCity = viewController.selectedCity
            if let location = selectedCity {
                headerView.lblLocation.text = location.full
            }
        }
    }
}

// MARK: UICollectionViewDataSource
extension ExploreViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        headerView = header as? ExploreHeaderView
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreCell
        let item = manager.explore(at: indexPath)
        
        cell.lblName.text = item.name
        cell.imgExplore.image = UIImage(named: item.image)
        return cell
    }
    
}
