//
//  DataStoreUserDefaults.swift
//  NeoCafe
//
//  Created by Adinay on 18/7/23.
//

import Foundation

class DataStoreUserDefaults: UserDefaultsDataStoreProtocol {
    
    static let shared = DataStoreUserDefaults()
    private  let userDefaults = UserDefaults.standard
    
    // MARK: - Ключи для access rerfresh Id Токенов
    
    private let pAccessToken = "AccessToken"
    private let pRefreshToken = "RefreshToken"
    
    func setAccessToken(_ token: String?) {
        userDefaults.set(token, forKey: pAccessToken)
    }
    
    func getAccessToken() -> String? {
        return userDefaults.string(forKey: pAccessToken)
    }
    
    func setRefreshToken(_ token: String?) {
        userDefaults.set(token, forKey: pRefreshToken)
    }
    
    func getRefreshToken() -> String? {
        return userDefaults.string(forKey: pRefreshToken)
    }
    
    // MARK: - Полное Удаление данных
    
    func removeAll() {
        userDefaults.removeObject(forKey: pAccessToken)
        userDefaults.removeObject(forKey: pRefreshToken)
    }
}
