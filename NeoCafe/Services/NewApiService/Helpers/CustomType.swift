//
//  CustomType.swift
//  NeoCafe
//
//  Created by Adinay on 31/7/23.
//


import Moya
import UIKit

// swiftlint:disable force_unwrapping

protocol CustomType: TargetType, AccessTokenAuthorizable { }

extension CustomType {
    var baseURL: URL {
        URL(string: "https://neo-cafe-neobis-d301ec8e3f9a.herokuapp.com/api")!
    }

    var headers: [String : String]? {
        return [
            "X-Device-Id": UIDevice.current.identifierForVendor?.uuidString ?? "",
            "X-Device-App": Bundle.main.bundleIdentifier ?? ""
        ]
    }
}
