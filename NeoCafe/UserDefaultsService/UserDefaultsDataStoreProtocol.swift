//
//  UserDefaultsDataStoreProtocol.swift
//  NeoCafe
//
//  Created by Adinay on 18/7/23.
//

import Foundation

protocol UserDefaultsDataStoreProtocol {
    func setAccessToken(_ token: String?)
    func getAccessToken() -> String? 
    
    func setRefreshToken(_ token: String?)
    func getRefreshToken() -> String?
    
    // Уничтажение обьектов
    func removeAll()
}
