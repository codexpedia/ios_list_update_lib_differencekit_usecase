//
//  FoodItem.swift
//  ios_list_update_lib_differencekit_usecase
//
//  Created by codexpedia on 1/30/19.
//  Copyright © 2019 codexpedia. All rights reserved.
//

import Foundation
import DifferenceKit

struct FoodItem: Differentiable {
    var type: FoodCategory
    var name: String

    var differenceIdentifier: String {
        return name
    }

    func isContentEqual(to source: FoodItem) -> Bool {
        return name == source.name
    }
}
