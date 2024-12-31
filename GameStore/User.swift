//
//  User.swift
//  GameStore
//
//  Created by Elnur Mammadov on 31.12.24.
//

import Foundation

struct User: Codable {
    let fullname: String?
    let phone: String?
    let email: String?
    let password: String?
    var card: Card?
}

struct Card: Codable {
    let number: String?
    let expirationDate: String?
    let cvc: String?
    var amount: Double?
}
