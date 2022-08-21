//
//  ContentView.swift
//  Recipe List App
//
//  Created by Arvil Pemaj on 8/11/22.
//

import SwiftUI

struct RecipeListView: View {
    
   // reference the view model
   @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView{
            
            List(model.recipes){ r in
                
                NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                    HStack(spacing:20){
                        Image(r.image).resizable().scaledToFill().frame(width: 50, height: 50, alignment: .center).clipped()
                        Text(r.name).cornerRadius(5)
                    }
                    
                })
                
               
            }.navigationBarTitle("All Recipes").padding()
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
