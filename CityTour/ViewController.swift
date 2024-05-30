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
    
    var filteredList: [City] = []
    var segmentedFilterList: [City] = []
    var searchFilteredList: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        filteredList = list
        segmentedFilterList = list
        searchFilteredList = list
        
        let xib = UINib(nibName: CityTableViewCell.id, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: CityTableViewCell.id)
    }
    
    @IBAction func segmentActions(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0: filteredList = searchFilteredList
        case 1: filteredList = searchFilteredList.filter { $0.domestic_travel }
        case 2: filteredList = searchFilteredList.filter { !$0.domestic_travel }
        default: break
        }
        
        tableView.reloadData()
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.id, for: indexPath) as! CityTableViewCell
        let data = filteredList[indexPath.row]
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

//MARK: Search
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text!
        var newList: [City] = []
        if text.isEmptyOrWhiteSpace {
            searchFilteredList = segmentedFilterList
        } else {
            for item in segmentedFilterList {
                if containsKeyword(data: item, text: text) {
                    newList.append(item)
                }
            }
            searchFilteredList = newList
        }
        filteredList = searchFilteredList
        view.endEditing(true)
        tableView.reloadData()
    }
    
    func containsKeyword(data: City, text: String) -> Bool {
        data.city_name.lowercased().contains(text.lowercased()) ||
        data.city_english_name.lowercased().contains(text.lowercased()) ||
        data.city_explain.lowercased().contains(text.lowercased()) ? true : false
    }
    
}
