//
//  EmptyViewController.swift
//  MintynApp
//
//  Created by Roy Aiyetin on 13/12/2022.
//

import UIKit

class EmptyViewController: UIViewController {

    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi, I'm Roy. Nice to meet you!"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(emptyLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        emptyLabel.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0, width: view.width - 20, height: view.height - 40)
    }

}
