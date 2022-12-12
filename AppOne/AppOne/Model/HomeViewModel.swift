//
//  HomeViewModel.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 21.11.22.
//

struct HomeViewModel {
    func fetchDataForItems() -> [Brand] {
        return [Brand(name: "Apple", headQuarters: "USA", ceo: "TC"),
                Brand(name: "SAP", headQuarters: "Germany", ceo: "CK"),
                Brand(name: "Google", headQuarters: "USA", ceo: "SP"),
                Brand(name: "Pfizer", headQuarters: "USA", ceo: "XX"),
                Brand(name: "Aspen", headQuarters: "Germany", ceo: "YY")]
    }

    func fetchDataForSections() -> [SectionTitle] {
       return [SectionTitle(title: "Tech Companies"),
               SectionTitle(title: "Pharma Companies")]
    }
}
