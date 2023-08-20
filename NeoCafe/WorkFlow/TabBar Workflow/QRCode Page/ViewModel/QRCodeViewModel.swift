//
//  QRCodeViewModel.swift
//  NeoCafe
//
//  Created by Adinay on 20/8/23.
//

import Foundation

class QRCodeViewModel {

    private let apiService: QRCodesApiSubServiceProtocol = NewApiService.shared
    
    func getMyBooked(completion: @escaping @MainActor (QRCode?) -> Void) {
        Task {
            do {
                let codes = try await apiService.getMyBooked()
                await completion(codes)
            } catch {
                debugPrint(error)
                await completion(nil)
            }
        }
    }

    func book(request: BookQrRequest, completion: @escaping @MainActor (Error?) -> Void) {
        Task {
            do {
                _ = try await apiService.book(request)
                await completion(nil)
            } catch {
                debugPrint(error)
                await completion(error)
            }
        }
    }
}
