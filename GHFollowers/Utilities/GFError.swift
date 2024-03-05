//
//  GFError.swift
//  GHFollowers
//
//  Created by Tsai Ming Chen on 2024/3/1.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername    = "Invalid username."
    case unableToComplete   = "Unable to complete your request. Please check your internet."
    case invalidResponse    = "Invaid response from server."
    case invalidData        = "Invalid data from server."
    case unableToFavorite   = "Error on adding favorite user."
    case alreadyInFavorite    = "Favorites already exist."
}
