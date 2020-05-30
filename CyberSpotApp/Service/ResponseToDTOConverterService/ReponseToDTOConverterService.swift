//
//  ReponseToDTOConverterService.swift
//  CyberSpotApp
//
//  Created by Евгений on 12.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol ReponseToDTOConverterService {
    
    /// Function for converting array of network matches models to array of matches DTO
    /// - Parameter matches: Array of network matches models to convert
    func convertToDTO(matches: [Match]) -> [MatchDTO]
}
