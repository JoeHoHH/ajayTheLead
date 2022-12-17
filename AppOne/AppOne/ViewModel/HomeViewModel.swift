//
//  HomeViewModel.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 21.11.22.
//

struct HomeViewModel {

    private let service: ServiceCalls
    private lazy var users: [Users] = []

    init(service: ServiceCalls) {
        self.service = service
    }

    private func fetchUsers() async {
        Task {
            try await service.fetchUsers()
        }
    }


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

extension HomeViewModel {
//    func fetchData() {
//        Task {
//            try await ServiceLayer().fetchUsers()
//        }
//    }
}
