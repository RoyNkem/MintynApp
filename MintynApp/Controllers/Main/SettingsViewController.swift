//
//  SettingsViewController.swift
//  MintynApp
//
//  Created by Roy Aiyetin on 13/12/2022.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    //MARK: - Properties
    private var models = [[SettingsCellModel]]() // array to fill tableView cell rows
    
    /// An Instance of Reusable SettingsTableViewCell
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        return tableView
    }()
    

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubviews(tableView)

        setupTableView()
        navigationTitle()
        configureModels()
    }
    
    //Layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
   
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none // remove lines from row cells

    }
    
    private func navigationTitle() {
        let titleFont = UIFont.systemFont(ofSize: 17.0)
        let title = "Settings"
        let titleSize = title.size(withAttributes: [.font: titleFont])
        
        let frame = CGRect(x: 0, y: 0, width: titleSize.width, height: 20.0)
        let titleLabel = UILabel(frame: frame)
        titleLabel.font = titleFont
        titleLabel.textColor = .red
        titleLabel.textAlignment = .center
        titleLabel.text = title
        navigationItem.titleView = titleLabel
    }
    
    //MARK: - Set up Models to present in cell rows
    private func configureModels() {
        
        var modelData = [SettingsCellModel]()
        
        let data: [String:String] = ["Profile":"person", "Account Management":"creditcard", "Referrals":"megaphone", "Legal":"shield", "Help and Support":"square.and.pencil", "System":"iphone.gen3", "Create Business Account":"arrow.triangle.2.circlepath", "Logout":"rectangle.portrait.and.arrow.right"]
        
        for (title, image) in data {
            
            let model = SettingsCellModel(title: title, image: (UIImage(named: image))) {
                print("coming")
            }
            modelData.append(model)
        }
        models.append(modelData)
    }
}

//MARK: - TableView Delegates
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    // tableView Datasource
    func numberOfSections(in: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
