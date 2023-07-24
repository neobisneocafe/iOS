//
//  UserDefaultsDataStoreProtocol.swift
//  NeoCafe
//
//  Created by Adinay on 18/7/23.
//

import Foundation

protocol UserDefaultsDataStoreProtocol {
    
    // Эта функция Сюда будет приходить токен
    func setAccessToken(_ token: String?)
    // Вытаскиваем AccessToken
    func getAccessToken() -> String?  // возращает String обьект
    
    // Сюда будет приходить токен setRefreshToken
    func setRefreshToken(_ token: String?)
    // Вытаскиваем getRefreshToken
    func getRefreshToken() -> String?
    
    // Уничтажение обьектов
    func removeAll()
}
