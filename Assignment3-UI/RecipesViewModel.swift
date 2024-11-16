//
//  RecipesViewModel.swift
//  Assignment3-UI
//
//  Created by Kanchan Kaur on 2024-11-15.
//

import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    private var service = RecipeService()
    
    func fetchRecipes() {
        service.fetchRecipes { [weak self] fetchedRecipes in
            self?.recipes = fetchedRecipes
        }
    }
}

