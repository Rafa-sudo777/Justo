//
//  User.swift
//  Jüsto
//
//  Created by Rafael Aviles Puebla on 15/06/22.
//

struct Results: Decodable {
  let results: [User]
  
  struct User: Decodable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let login: Login
    let dob, registered: Dob
    let phone, cell: String
    let id: ID
    let picture: Picture
    let nat: String
  }

  struct Dob: Decodable {
      let date: String
      let age: Int
  }

  struct ID: Decodable {
      let name: String
  }

  struct Location: Decodable {
      let street: Street
      let city, state, country: String
      let postcode: Int
  }

  struct Street: Decodable {
      let number: Int
      let name: String
  }

  struct Login: Decodable {
      let uuid, username, password: String
  }

  struct Name: Decodable {
      let title, first, last: String
  }

  struct Picture: Decodable {
      let large: String
  }
}
