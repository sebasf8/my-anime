//
//  Constants.swift
//  my-anime
//
//  Created by Sebastian Fernandez on 22/08/2021.
//

import Foundation
import UIKit.UIColor

struct Constants {
    struct API {
        static let baseURL = "https://kitsu.io/api/edge"
    }
    
    struct Color {
        static let primaryColor = UIColor(red: 0.25, green: 0.26, blue: 0.27, alpha: 1.0);
        static let primaryLightColor = UIColor(red: 0.42, green: 0.43, blue: 0.44, alpha: 1.0);
        static let primaryDarkColor = UIColor(red: 0.10, green: 0.11, blue: 0.12, alpha: 1.0);
        static let primaryTextColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0);
        
        static let secondaryColor = UIColor(red: 0.39, green: 0.71, blue: 0.96, alpha: 1.0);
        static let secondaryLightColor = UIColor(red: 0.61, green: 0.91, blue: 1.00, alpha: 1.0);
        static let secondaryDarkColor = UIColor(red: 0.13, green: 0.53, blue: 0.76, alpha: 1.0);
        static let secondaryTextColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.0);

    }
}
