//
//  RestaurantListViewController.swift
//  LetsEat
//
//  Created by corey on 10/26/20.
//

import UIKit

class RestaurantListViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


// MARK: Private Extension
private extension RestaurantListViewController {
    
}


// MARK: UICollectionViewDataSource
extension RestaurantListViewController:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantCell", for: indexPath)
    }
    
}
