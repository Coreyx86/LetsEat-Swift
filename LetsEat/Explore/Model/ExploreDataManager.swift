//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by corey on 10/28/20.
//

import Foundation

class ExploreDataManager {
    
    fileprivate var items:[ExploreItem] = []
    
    //Populates the ExploreItem array 'items'
    func fetch() {
        for data in loadData() {
            items.append(ExploreItem(dict:data))
            //print(data)
        }
    }
    
    //Returns the number of cells to display in the view
    func numberOfItems() -> Int {
        return items.count
    }
    
    func explore(at index:IndexPath) -> ExploreItem {
        return items[index.item]
    }
    
    //Reads the data in ExploreData.plist and returns an array of dictionaries containing KeyValuePairs of <String, AnyObject>
    fileprivate func loadData() -> [[String:AnyObject]] {
        guard let path = Bundle.main.path(forResource: "ExploreData", ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
            return [[:]]
        }
        return items as! [[String:AnyObject]]
    }
    
    
}
