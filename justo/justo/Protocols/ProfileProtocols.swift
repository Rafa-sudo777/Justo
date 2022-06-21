//
//  ProfileProtocols.swift
//  Jüsto
//
//  Created by Rafael Aviles Puebla on 15/06/22.
//

protocol ProfilePresenterProtocol {
  func getUser()
  func setViewDelegate(delegate: ProfileViewProtocol)
}

protocol ProfileViewProtocol {
  func retreiveUser(user: UserData)
}
