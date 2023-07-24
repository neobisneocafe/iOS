//
//  BranchDTO.swift
//  NeoCafe
//
//  Created by Adinay on 20/7/23.
//

import Foundation

struct BranchDTO: Codable {
    let id: String
    let name: String?
    let adress: String?
    let opening_time: Date?
    let closing_time: Date?
    let imageUrl: String?
}
