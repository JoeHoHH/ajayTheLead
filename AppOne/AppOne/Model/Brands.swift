//
//  Brands.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 20.11.22.
//

struct Brands : Hashable {
    let name: String
    let headQuarters: String
    let ceo: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
