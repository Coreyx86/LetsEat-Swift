//
//  LocationDataManager.swift
//  LetsEat
//
//  Created by corey on 10/28/20.
//

import Foundation

class LocationDataManager : DataManager {
    private var locations:[LocationItem] = []
    
    func fetch() {
        for location in load(file: "Locations") {
            locations.append(LocationItem(dict: location))
        }
    }
    
    func numberOfItems() -> Int {
        return locations.count
    }
    
    func locationItem(at index:IndexPath) -> LocationItem {
        return locations[index.item]
    }
    
    func findLocation(by name:String) -> (isFound:Bool, position:Int) {
        guard let index = locations.firstIndex(where:{$0.city == name}) else {
            return (isFound:false, position:0)
        }
        
        return (isFound: true, position:index)
    }
    
}
