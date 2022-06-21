//
//  ProfilePresenter.swift
//  Jüsto
//
//  Created by Rafael Aviles Puebla on 15/06/22.
//

import Foundation

typealias UserData = (String, String, [String : String])

final class ProfilePresenter {
  var view: ProfileViewProtocol?
  private let networkHelper = NetworkHelper()
}

extension ProfilePresenter: ProfilePresenterProtocol {
  func setViewDelegate(delegate: ProfileViewProtocol) {
    view = delegate
  }
  
  func getUser() {
    networkHelper.fetch { [weak self] result in
      switch result {
        case .success(let data):
          guard let user = try? JSONDecoder().decode(Results.self, from: data).results else {
            return
          }
          self?.createUserCellInfo(with: user.first!)
        case .failure(let error):
          print(error.localizedDescription)
      }
    }
  }
  
  private func createUserCellInfo(with data: Results.User) {
    let userInfo = ["Gender" : data.gender,
                    "E-mail": data.email,
                    "Cell": data.cell,
                    "Location": "\(data.location.country), \(data.location.city)"]
    
    view?.retreiveUser(user: ("\(data.name.title). \(data.name.first) \(data.name.last)",
                               data.picture.large,
                               userInfo))
  }
}
