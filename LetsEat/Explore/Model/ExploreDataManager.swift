//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by corey on 10/28/20.
//

import Foundation

class ExploreDataManager : DataManager {
    
    fileprivate var items:[ExploreItem] = []
    
    //Populates the ExploreItem array 'items'
    func fetch() {
        for data in load(file: "ExploreData") {
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
    
    
}
