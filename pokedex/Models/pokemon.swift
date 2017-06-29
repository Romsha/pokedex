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
    
    var name: String {
        get {
            return _name
        }
        set (newName) {
            _name = newName
        }
    }
    
    var id: Int {
        get {
            return _id
        }
        set (newId) {
            _id = newId
        }
    }
    
    init(name: String, id: Int) {
        self._name = name
        self._id = id
    }
    
    
    
}
