//
//  Users.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 14.12.22.
//

import Foundation

struct Users: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Decodable {
    let lat: String
    let lng: String
}

struct Company: Decodable {
    let name: String
    let catchPhrase: String
    let biggestBS: String

    enum CodingKeys: String, CodingKey {
        case name
        case catchPhrase
        case biggestBS = "bs"
    }
}
