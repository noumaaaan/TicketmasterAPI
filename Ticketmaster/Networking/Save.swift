//
//  Save.swift
//  Ticketmaster
//
//  Created by Noumaan Mehmood on 16/05/2024.
//

import Foundation

final class Save {
    
    func retrieveCountrySetting() -> TMCountryCode {
        let defaults = UserDefaults.standard
        let result = defaults.string(forKey: "country") ?? ""
        return TMCountryCode(rawValue: result) ?? .greatBritain
    }
    
    func saveCountrySetting(country: TMCountryCode) {
        let defaults = UserDefaults.standard
        defaults.set(country.rawValue, forKey: "country")
    }
}
