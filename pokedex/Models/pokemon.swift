//
//  pokemon.swift
//  pokedex
//
//  Created by Rom Sharony on 29/06/2017.
//  Copyright © 2017 Rom Sharony. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _id: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _attack: String!
    private var _height: String!
    private var _weigth: String!
    private var _nextEvoText: String!
    private var _nextEvoID: Int!
    
    private var _pokemonURL: String!
    
    init(name: String, id: Int) {
        
        self._name = name
        self._id = id
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._id!)/"
        
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        
        Alamofire.request(_pokemonURL).responseJSON { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dict["weight"] as? String {
                    self._weigth = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] , types.count > 0 {
                    
                    var typeNames = [String]()
                    for typeDict in types {
                        
                        if let typeName = typeDict["name"] {
                            typeNames.append(typeName.capitalized)
                        }
                        
                    }
                    
                    self._type = typeNames.joined(separator: ", ")
                }
                
                if let evos = dict["evolutions"] as? [Dictionary<String, AnyObject>], evos.count > 0 {
                    
                    var evoFound = false
                    if let level = evos[0]["level"] as? Int {
                        
                        if let nextURI = evos[0]["resource_uri"] as? String {
                            
                            let nextEvo = nextURI.components(separatedBy: "/")
                            let evoID = nextEvo[nextEvo.count - 2]
                            
                            if let evoTo = evos[0]["to"] as? String {
                                self._nextEvoID = Int(evoID)
                                self._nextEvoText = "Next Evolution: \(evoTo) LVL \(level)"
                                evoFound = true
                            }
                        }
                        
                    }
                    
                    if !evoFound {
                        self._nextEvoID = 0
                        self._nextEvoText = "No Further Evolutions"
                    }
                    
                }
                
                if let descriptions = dict["descriptions"] as? [Dictionary<String, AnyObject>]
                    , descriptions.count > 0 {
                    
                    if let uri = descriptions[0]["resource_uri"] as? String {
                        
                        Alamofire.request("\(URL_BASE)\(uri)").responseJSON { (response) in
                            
                            if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                                
                                if let description = descDict["description"] as? String {
                                    let newDesc = description.replacingOccurrences(of: "POKMON", with: "pokemon")
                                    self._description = newDesc
                                    print(newDesc)
                                }
                                
                            }
                            
                            completed()
                            
                        }
                        
                    }
                    
                }
                
            }
            
            completed()
            
        }
        
        
        
    }
    
    var name: String {
        return _name
    }
    
    var id: Int {
        return _id
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weigth: String {
        if _weigth == nil {
            _weigth = ""
        }
        return _weigth
    }
    
    var nextEvoText: String {
        if _nextEvoText == nil {
            _nextEvoText = ""
        }
        return _nextEvoText
    }
    
    var nextEvoID: Int {
        if _nextEvoID == nil {
            _nextEvoID = 0
        }
        return _nextEvoID
    }
    
}
