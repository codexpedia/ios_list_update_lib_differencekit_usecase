//
//  DataFactory.swift
//  ios_list_update_lib_differencekit_usecase
//
//  Created by Peng on 1/31/19.
//  Copyright © 2019 codexpedia. All rights reserved.
//

import Foundation
import DifferenceKit

typealias FoodSection = ArraySection<FoodCategory, FoodItem>

struct DataFactory {
    
    static func createSampleData() -> [FoodSection] {
        let foodData = [
            (FoodCategory.Meat, ["Beef","Chicken","Lamb","Turkey", "Pork"]),
            (FoodCategory.Seafood, ["Fish","Shrimp","Crab", "Jellyfish"]),
            (FoodCategory.Fruit, ["Apple","Banana","Cherry", "Pineapple"]),
            (FoodCategory.Vegetable, ["Lettuce","Broccoli","Spinach", "Cauliflower"])
        ]
        
        var foodSections = [FoodSection]()
        
        for (key, values) in foodData {
            let foodItems = values
                .map { FoodItem(type: key, name: $0) }
                .shuffled()
                .prefix(upTo: Int(arc4random_uniform(UInt32(values.count))))
            if !foodItems.isEmpty { foodSections.append(FoodSection(model: key, elements: foodItems)) }
        }
        return foodSections
    }
    
}
