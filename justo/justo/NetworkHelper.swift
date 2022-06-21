//
//  NetworkHelper.swift
//  Jüsto
//
//  Created by Rafael Aviles Puebla on 15/06/22.
//

import Foundation.NSJSONSerialization

final class NetworkHelper {
  
  private var baseURL = "https://randomuser.me/api/"
  
  enum ErrorType: Error {
    case fail
  }
  
  func fetch(complition: @escaping(Result<Data, ErrorType>) -> Void) {
    guard let url = URL(string: baseURL) else { return }
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      guard let data = data else {
        complition(.failure(.fail))
        return
      }
      if error == nil {
        complition(.success(data))
      } else {
        complition(.failure(.fail))
      }
    }.resume()
  }
}
