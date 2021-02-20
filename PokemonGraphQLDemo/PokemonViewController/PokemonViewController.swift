//
//  ViewController.swift
//  PokemonGraphQLDemo
//
//  Created by ko on 2020/9/18.
//  Copyright © 2020 SM. All rights reserved.
//

import UIKit
import MBProgressHUD

class PokemonViewController: UIViewController {
    let cellID = "Cell"
    var pokemonViewmodel: PokemenViewModel?
    
    lazy var tableView: UITableView! = {
        let view = UITableView.init(frame: .zero, style: .plain)
        view.rowHeight = UITableView.automaticDimension
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    var safeLayoutGuide:UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "Graphql Pokemon!"
        
        //tableView
        self.tableView.register(ItemCell.self, forCellReuseIdentifier: self.cellID)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
       
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeLayoutGuide.bottomAnchor)
        ])
        
        //load Data
        loadData()
        print("finish")
    }
    
    func loadData() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        AllenRequestCenter.shared.apolloClient.fetch(query: GetPokemonsQuery(first: 20)) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
                
                self.pokemonViewmodel = PokemenViewModel(pokemons: (graphQLResult.data?.pokemons)!)
                self.tableView.reloadData()
                MBProgressHUD.hide(for: self.view, animated: false)
                
            case .failure(let error):
                self.warningAlert(errorMessage: "Failure! Error: \(error.localizedDescription)")
                
            }
            
        }
    }

}

 
