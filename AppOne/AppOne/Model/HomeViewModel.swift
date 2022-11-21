//
//  HomeViewModel.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 21.11.22.
//

struct HomeViewModel {
    func fetchDataForItems() -> [Brands] {
        return [Brands(name: "Apple", headQuarters: "USA", ceo: "TC"),
                Brands(name: "SAP", headQuarters: "Germany", ceo: "CK"),
                Brands(name: "Google", headQuarters: "USA", ceo: "SP"),
                Brands(name: "Pfizer", headQuarters: "USA", ceo: "XX"),
                Brands(name: "Aspen", headQuarters: "Germany", ceo: "YY")]
    }

    func fetchDataForSections() -> [SectionTitles] {
       return [SectionTitles(title: "Tech Companies"),
               SectionTitles(title: "Pharma Companies")]
    }
}
