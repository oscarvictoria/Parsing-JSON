//
//  ViewController.swift
//  Parsing-JSON-URLSession
//
//  Created by Oscar Victoria Gonzalez  on 8/4/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class StationsViewController: UIViewController {
    
    enum Section {
        case primary
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: UITableViewDiffableDataSource<Section, Station>!
    
    
    let apiClient = APIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Citi Bike Stations"
        fetchBusinesses()
    }
    
    private func configureDataSource() {
        
    }
    
    func fetchBusinesses() {
        apiClient.fetchDataUsingToken { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let businesses):
                dump(businesses)
            }
        }
    }

    func fetchBikes() {
        apiClient.fetchData { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let stattion):
                dump(stattion)
            }
        }
    }

}

