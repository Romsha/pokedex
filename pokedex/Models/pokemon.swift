//
//  pokemon.swift
//  pokedex
//
//  Created by Rom Sharony on 29/06/2017.
//  Copyright © 2017 Rom Sharony. All rights reserved.
//

import Foundation

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
    
    init(name: String, id: Int, description: String, type: String,
         defense: String, attack: String, height: String,
         weight: String, nextEvoText: String) {
        self._name = name
        self._id = id
        self._description = description
        self._type = type
        self._defense = defense
        self._attack = attack
        self._height = height
        self._weigth = weight
        self._nextEvoText = nextEvoText
    }
    
    var name: String {
        return _name
    }
    
    var id: Int {
        return _id
    }
    
    var description: String {
        return _description
    }
    
    var type: String {
        return _type
    }
    
    var defense: String {
        return _defense
    }
    
    var attack: String {
        return _attack
    }
    
    var height: String {
        return _height
    }
    
    var weigth: String {
        return _weigth
    }
    
    var nextEvoText: String {
        return _nextEvoText
    }
    
}
