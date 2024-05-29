//
//  CityTableViewCell.swift
//  CityTour
//
//  Created by J Oh on 5/29/24.
//

import UIKit
import Kingfisher

class CityTableViewCell: UITableViewCell {
    
    static let id = "CityTableViewCell"
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var explainLabel: UILabel!
    
    @IBOutlet var explainBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
        configureCell()
    }
    
    func configureCell() {
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.textColor = .white
        
        cityImageView.backgroundColor = .systemGray6
        cityImageView.contentMode = .scaleAspectFill
        
        explainBackgroundView.backgroundColor = .black.withAlphaComponent(0.5)
        
        explainLabel.font = .systemFont(ofSize: 14)
        explainLabel.textColor = .white.withAlphaComponent(0.8)
        
    }
    
    func configureData(data: City) {
        nameLabel.text = data.name
        
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "suitcase.rolling"))
        
        explainLabel.text = data.city_explain
    }
    
    
}



//struct City {
//    let city_name: String
//    let city_english_name: String
//    let city_explain: String
//    let city_image: String
//    let domestic_travel: Bool
//
//    var name: String {
//        city_name + " | " + city_english_name
//    }
//
//}
