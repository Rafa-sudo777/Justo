//
//  ProfileViewController.swift
//  Jüsto
//
//  Created by Rafael Aviles Puebla on 15/06/22.
//

import UIKit

final class ProfileViewController: UIViewController {
  
  @IBOutlet private var profileImage: UIImageView!
  @IBOutlet private var infoTableView: UITableView!
  @IBOutlet private var fullNameLabel: UILabel!
  
  private var presenter = ProfilePresenter()
  private var (picture, fullName, info): (String?, String?, [String : String]?)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  @IBAction func getNewUser(_ sender: Any) {
    getUser()
  }
  
  private func configure() {
    let nibCell = UINib(nibName: String(describing: ProfileCell.self), bundle: nil)
    infoTableView.register(nibCell, forCellReuseIdentifier: "profileCell")
    presenter.setViewDelegate(delegate: self)
    getUser()
  }
  
  private func getUser() {
    presenter.getUser()
  }
}

extension ProfileViewController: ProfileViewProtocol {
  func retreiveUser(user: UserData) {
    info = user.2
    if let url = URL(string: user.1),
       let imageData = try? Data(contentsOf: url) {
    DispatchQueue.main.async { [unowned self] in
        infoTableView.reloadData()
        profileImage.image = UIImage(data: imageData)
        fullNameLabel.text = user.0
      }
    }
  }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as? ProfileCell else {
      return UITableViewCell()
    }
    
    if let info = info {
      cell.configure(title: Array(info.keys)[indexPath.row], subtitle: Array(info)[indexPath.row].value)
    }
    return cell
  }
}
