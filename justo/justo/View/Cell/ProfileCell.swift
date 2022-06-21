//
//  ProfileCell.swift
//  justo
//
//  Created by Rafael Aviles Puebla on 15/06/22.
//

import UIKit

final class ProfileCell: UITableViewCell {
  
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var subtitleLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    selectionStyle = .none
    // Configure the view for the selected state
  }
  func configure(title: String, subtitle: String) {
    titleLabel.text = title
    subtitleLabel.text = subtitle
  }
}
