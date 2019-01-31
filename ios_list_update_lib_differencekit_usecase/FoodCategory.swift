//
//  FoodCategory.swift
//  ios_list_update_lib_differencekit_usecase
//
//  Created by codexpedia on 1/30/19.
//  Copyright © 2019 codexpedia. All rights reserved.
//

import Foundation
import DifferenceKit

enum FoodCategory: String, Differentiable, CaseIterable {
    case Meat, Seafood, Vegetable, Fruit
}
