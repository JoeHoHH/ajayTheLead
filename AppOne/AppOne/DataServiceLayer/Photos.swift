//
//  Photos.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 15.12.22.
//

import Foundation

struct Photos: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
