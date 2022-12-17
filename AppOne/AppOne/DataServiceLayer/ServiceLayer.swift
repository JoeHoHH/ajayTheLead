//
//  ServiceLayer.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 13.12.22.
//

import Foundation

protocol ServiceCalls {
    func fetchToDOs(completion: @escaping (Result<[ToDos], ErrorType>) -> Void)
    func fetchUsers() async throws -> [Users]
    func fetchPhotos() async throws -> [Photos]
}

class ServiceLayer: ServiceCalls {

    func fetchToDOs(completion: @escaping (Result<[ToDos], ErrorType>) -> Void) {
        if let todosUrl = URL(string: "https://jsonplaceholder.typicode.com/todos") { URLSession.shared.dataTask(with: todosUrl) { (data, response, error) in
            if error != nil {
                completion(.failure(.serviceError))
                return
            }

            if let data = data {
                let todosData = try JSONDecoder().decode([ToDos].self, from: data)
                completion(.success(todosData))
                return
            }
        }.resume()
        }
    }

    func fetchPhotos() async throws -> [Photos] {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
                throw ErrorType.wrongURL
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let photos = try JSONDecoder().decode(Photos.self, from: data)
                return [photos]
            } catch {
                throw ErrorType.responseError
            }
    }

    func fetchUsers() async throws -> [Users] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            throw ErrorType.wrongURL
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Users.self, from: data)
            return [response]
        } catch {
            throw ErrorType.responseError
        }
    }
}

enum ErrorType: Error {
    case networkError
    case serviceError
    case wrongURL
    case responseError
}
