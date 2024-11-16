//
//  RecipeService.swift
//  Assignment3-UI
//
//  Created by Kanchan Kaur on 2024-11-15.
//

import Foundation
import Combine

class RecipeService {
    private let baseURL = "https://assignment-3-api-framework.onrender.com/api/getall/recipes"     // Base URL for the API endpoint to fetch recipes
    private var cancellables = Set<AnyCancellable>()
    
    func fetchRecipes(completion: @escaping ([Recipe]) -> Void) {
        guard let url = URL(string: baseURL) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Recipe].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                if case .failure(let error) = result {      // Handles any errors that occur during the network request
                    print("Error fetching recipes: \(error)")
                }
            }, receiveValue: { recipes in
                completion(recipes)
            })
            .store(in: &cancellables)
    }
}

