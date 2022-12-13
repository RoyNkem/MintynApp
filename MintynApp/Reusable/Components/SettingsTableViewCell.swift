//
//  SettingsTableViewCell.swift
//  MintynApp
//
//  Created by Roy Aiyetin on 13/12/2022.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let identifier = "SettingsTableViewCell"

    private var model: SettingsCellModel?

    private let iconView: UIImageView = {
        let icon = UIImageView()
        
        return icon
    }()
    
    // Title label
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Profile"
        return label
    }()
    
    //MARK: - Configure model
    //we are accessing the value of the model we get from SettingsVC and stin our cell model property
    public func configure(with model: SettingsCellModel) {
        self.model = model

        iconView.image = model.image
        titleLabel.text = model.title
    }
    
    //MARK: - Override Functions
    /// Cell Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        contentView.addSubviews(iconView, titleLabel)
        
        selectionStyle = .none // color of cell when selected/tapped
    }
    
    /// Prepare Cell For Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconView.image = nil
        titleLabel.text = nil
    }
    
    /// Assign Frames to Cell Items
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconView.anchor(top: contentView.topAnchor, paddingTop: 5, bottom: contentView.bottomAnchor, paddingBottom: 5, left: contentView.leftAnchor, paddingLeft: 5, right: contentView.rightAnchor, paddingRight: 5, width: 30, height: 30)
        titleLabel.anchor(top: contentView.topAnchor, paddingTop: 5, bottom: contentView.bottomAnchor, paddingBottom: 5, left: iconView.leftAnchor, paddingLeft: 5, right: contentView.rightAnchor, paddingRight: 5, width: contentView.width - (iconView.width + 10), height: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
