//
//  ServiceLayer.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 13.12.22.
//

import Foundation

struct Users: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case email
        case address = "address"
        case phone
        case website
        case company
    }
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat: String
    let lng: String
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let biggestBS: String

    enum CodingKeys: String, CodingKey {
        case name
        case catchPhrase
        case biggestBS = "bs"
    }
}


class ServiceLayer {
    func fetchUsers() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Users.self, from: data)
            print(response)
        } catch {
            print("Catch called")
        }
    }
}
