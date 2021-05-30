//
//  Beer.swift
//  BeerSearchingApp
//
//  Created by Juan Fernández Otero on 29/5/21.
//

import Foundation


struct Beer: Decodable {
    let id: Int?
    let name: String?
    let tagline: String?
    let first_brewed: String?  // Date MM/yyyy
    let description: String?
    let image_url: String?
    let abv: Double?
    let ibu: Double?
    let target_fg: Double?
    let target_og: Double?
    let ebc: Double?
    let srm: Double?
    let ph: Double?
    let attenuation_level: Double?
    let food_pairing: Array<String>?
    
}
