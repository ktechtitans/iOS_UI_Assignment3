//
//  RecipeListView.swift
//  Assignment3-UI
//
//  Created by Kanchan Kaur on 2024-11-15.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {   // NavigationView is used to wrap the List
            List(viewModel.recipes) { recipe in
                VStack(alignment: .leading) {
                    Text(recipe.recipeName)
                        .font(.headline)
                    
                    Text("Cuisine: \(recipe.cuisine)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("Rating: \(recipe.averageRating, specifier: "%.1f")/5")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Favorite Recipes")   // Navigation title sets the title for the navigation bar
            .onAppear {
                viewModel.fetchRecipes()
            }
        }
    }
}

#Preview {
    RecipeListView()
}
