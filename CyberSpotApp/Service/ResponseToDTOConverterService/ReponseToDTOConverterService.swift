//
//  ReponseToDTOConverterService.swift
//  CyberSpotApp
//
//  Created by Евгений on 12.04.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol ReponseToDTOConverterService {
    func convertToDTO(matches: [Match]) -> [MatchDTO]
}
