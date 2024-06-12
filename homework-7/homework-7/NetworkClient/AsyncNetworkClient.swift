//
//  AsyncNetworkClient.swift
//  homework-7
//
//  Created by Vladislav Mishukov on 09.06.2024.
//

import Foundation

protocol AsyncNetworkClientProtocol {
    func fetch(from request: URLRequest) async throws -> Data
}

enum NetworkError: Error {
    case connectingError(error: URLError)
    case codeError(code: Int)
    case parseError
    case authFailed
    case unknownError(error: Error)

    var description: String {
        switch self {
        case let .connectingError(error):
            return "Ошибка соединения: \(error.localizedDescription), \(error.code)"
        case let .codeError(code):
            return "Сервер ответил ошибкой: \(code)"
        case .parseError:
            return "Ошибка разбора данных"
        case let .unknownError(error):
            return "Неизвестная ошибка: \(error.localizedDescription)"
        case .authFailed:
            return "Ошибка авторизации"
        }
    }
}

class AsyncNetworkClient: NSObject, AsyncNetworkClientProtocol {
    
    func fetch(from request: URLRequest) async throws -> Data {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            if let response = response as? HTTPURLResponse,
                response.statusCode < 200 || response.statusCode >= 300 {
                if response.statusCode == 401 {
                    throw NetworkError.authFailed
                }
                throw NetworkError.codeError(code: response.statusCode)
            }

            return data
        } catch let error as URLError {
            throw NetworkError.connectingError(error: error)
        } catch {
            throw NetworkError.unknownError(error: error)
        }
    }
}
