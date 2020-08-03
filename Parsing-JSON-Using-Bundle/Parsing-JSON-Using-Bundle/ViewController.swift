//
//  ViewController.swift
//  Parsing-JSON-Using-Bundle
//
//  Created by Oscar Victoria Gonzalez  on 8/3/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    typealias DataSource = UITableViewDiffableDataSource<Section, President>
    
    // Both section and Item identifier must conform to hashable
    private var dataSource: DataSource!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        configureDataSource()
        fetchPresidents()
    }
    
    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { (tableView, indexPath, president) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = president.name
            cell.detailTextLabel?.text = "\(president.number)"
            return cell
        })
        var snapshot = NSDiffableDataSourceSnapshot<Section, President>()
        snapshot.appendSections([.main])
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func fetchPresidents() {
        var presidents: [President] = []
        
        do {
            presidents = try Bundle.main.parseJSON(with: "Presidents")
            
        } catch {
            print("error \(error)")
        }
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(presidents, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

}

