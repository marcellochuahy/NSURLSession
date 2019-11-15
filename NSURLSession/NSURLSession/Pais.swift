//
//  Pais.swift
//  NSURLSession
//
//  Created by Marcello Chuahy on 15/11/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

import Foundation

struct Pais: Codable {
    
    let pais: String
    let capital: String
    
    init(pais: String, capital: String) {
        self.pais = pais
        self.capital = capital
    }
    
}

