//
//  Server+Extension.swift
//  NeoCafe
//
//  Created by Adinay on 17/7/23.
//

import Foundation

extension Dictionary {
    func toData() -> Data {
        (try? JSONSerialization.data(withJSONObject: self)) ?? Data()
    }
}

extension Encodable {
    func toData() -> Data {
        (try? JSONEncoder().encode(self)) ?? Data()
    }
}
