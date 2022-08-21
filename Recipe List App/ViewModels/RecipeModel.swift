//
//  File.swift
//  Recipe List App
//
//  Created by Arvil Pemaj on 8/11/22.
//

import Foundation

class RecipeModel: ObservableObject{
    
    @Published var recipes = [Recipe]()
    
    init(){
        //create an instance of data service and get the data
        
        self.recipes = DataService.getLocalData()
    }
}
