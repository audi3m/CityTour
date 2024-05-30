//
//  String+Ex.swift
//  CityTour
//
//  Created by J Oh on 5/30/24.
//

import UIKit

extension String {
    var isEmptyOrWhiteSpace: Bool {
        let cutText = self.trimmingCharacters(in: [" "])
        return cutText.isEmpty
    }
}
