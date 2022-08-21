//
//  DataService.swift
//  Recipe List App
//
//  Created by Arvil Pemaj on 8/11/22.
//

import Foundation

class DataService{
    
    static func getLocalData() -> [Recipe]{
        //parse local json file
        //get url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        //check if pathString is not nil, otherwise..making sure something is true before returning
        guard pathString != nil else{
            
            return [Recipe]()
        }
        //create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            //create a data object
            let data = try Data(contentsOf: url)
            
            //decode the data with a json decoder
            let decoder = JSONDecoder()
            
            do{
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //add the unique IDs
                for r in recipeData{
                    r.id = UUID()
                }
                //return the recipes
                
                return recipeData
            }
            catch{
                //error with parsing json
                print(error)
            }
            
        }
        catch{
            //error getting data
            print(error)
        }
    return [Recipe]()
        
    }
    
}
