//
//  PokemonViewModel.swift
//  PokemonGraphQLDemo
//
//  Created by ko on 2020/9/18.
//  Copyright © 2020 SM. All rights reserved.
//

import Foundation
import SDWebImage

public typealias ImageDownloadCompletionImage = (_ imageData: UIImage ) -> Void

class PokemenViewModel
{
    
    var pokemons: [GetPokemonsQuery.Data.Pokemon?]?
    
    public var count: Int {
        return self.pokemons?.count ?? 0
    }
    
    init(pokemons: [GetPokemonsQuery.Data.Pokemon?]){
        self.pokemons = pokemons
    }
    
    public func indexPokemonModel(_ index: IndexPath) -> GetPokemonsQuery.Data.Pokemon? {
        return self.pokemons?[index.row]
    }
    
    public func getImage(_ index: IndexPath , completionHanlder: @escaping ImageDownloadCompletionImage) {
        let imageURL =  self.pokemons?[index.row]?.image
        
        
        let manager:SDWebImageManager = SDWebImageManager.shared
        manager.loadImage(with: URL(string: imageURL!), options: .queryMemoryData, progress: { (receivedSize, expectedSize, url) in
            
        }) { (image, data, error, catchType, finished, imageURL) in
           
            if let img =  image {
                completionHanlder(img)
            }
            
        }
        
    }
 
}
