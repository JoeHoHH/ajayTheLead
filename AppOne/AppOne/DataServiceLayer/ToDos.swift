//
//  ToDos.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 15.12.22.
//

import Foundation

struct ToDos: Decodable {
    let userID: Int
    let id: Int
    let title: String
    let completed: Bool
}
