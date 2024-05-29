//
//  ViewController.swift
//  CityTour
//
//  Created by J Oh on 5/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    let list = CityInfo.city
    var segFilteredList: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        segFilteredList = list
        
        let xib = UINib(nibName: CityTableViewCell.id, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityTableViewCell.id)
    }
    
    
    @IBAction func segmentActions(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            segFilteredList = list
        case 1:
            segFilteredList = list.filter { $0.domestic_travel == true }
        case 2:
            segFilteredList = list.filter { $0.domestic_travel == false }
        default:
            break;
        }
        
        tableView.reloadData()
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        segFilteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.id, for: indexPath) as! CityTableViewCell
        let data = list[indexPath.row]
        cell.configureData(data: data)
        
        return cell
    }
}


// MARK: TableView Settings
extension ViewController {
    func configureTableView() {
        navigationItem.title = "인기 도시"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 160
        
        tableView.separatorStyle = .none
    }
}


//MARK: Segmented Control
extension ViewController {
    
    
    
    
}
