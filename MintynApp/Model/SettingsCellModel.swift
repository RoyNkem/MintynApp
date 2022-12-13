//
//  SettingsModel.swift
//  MintynApp
//
//  Created by Roy Aiyetin on 13/12/2022.
//

import UIKit

struct SettingsCellModel {
    
    //MARK: - Properties
    var title: String
    var image: UIImage?
    var handler: (() -> Void) //closure that takes no argument and returns void
}
