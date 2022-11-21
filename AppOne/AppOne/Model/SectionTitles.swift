//
//  SectionTitles.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 21.11.22.
//

struct SectionTitles : Hashable {
    let title: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
