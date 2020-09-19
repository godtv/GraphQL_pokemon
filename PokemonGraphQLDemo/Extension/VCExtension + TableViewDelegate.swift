//
//  VC-Extension + TableViewDelegate.swift
//  PokemonGraphQLDemo
//
//  Created by ko on 2020/9/18.
//  Copyright © 2020 SM. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

// MARK: - UITableView Delegate
extension PokemonViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PokemonViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonViewmodel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath) as? ItemCell
       
        let data = pokemonViewmodel?.indexDataViewModel(indexPath)
        
        pokemonViewmodel?.getImage(indexPath, completionHanlder: { (image) in
            cell?.cellImgv.image = image
        })

        cell?.titleLabel.text =   data?.name ?? "N/A"
        cell?.numLabel.text =  ("Number: \(data?.number ?? "N/A")")

        cell?.selectionStyle = .none



        return cell!
    }
    
}

extension PokemonViewController {
    // MARK: - warningAlert
    func warningAlert(errorMessage: String?) {
        
        let alertController = UIAlertController(title: "Error!",
            message: errorMessage,
            preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        MBProgressHUD.hide(for: self.view, animated: false)
    }
}
