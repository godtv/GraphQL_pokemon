//
//  AllenRequestCenter.swift
//  PokemonGraphQLDemo
//
//  Created by ko on 2020/9/18.
//  Copyright © 2020 SM. All rights reserved.
//

import Foundation
import Apollo

class AllenRequestCenter {
    static let shared: AllenRequestCenter = AllenRequestCenter()
    var apolloClient = ApolloClient(url: URL(string: API_URL.GRAPHQL_POKEMON)!)
    
}
 
