//
//  ViewController.swift
//  iOSmeetup
//
//  Created by bbb on 11/27/18.
//  Copyright © 2018 bbb. All rights reserved.
//

import UIKit

enum ViewControllerMode {
    case admin,
    `default`,
    restricted,
    banned
}

enum DescriptionViewStyle {
    case admin,
    `default`,
    notEnoughRights
}

final class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    let dataSource = Array(1...100)
        .map { _ in DataBaseManager.shared.getUserName(id:) • User.init(name: ) § Faker.shared.generateUniqueId() }
    
    let mode = ViewControllerMode.admin
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let generateUniqueIdFunctionPointer = Faker.generateUniqueId
        let fFunctionPointer = Faker.f
        
        let id = generateUniqueIdFunctionPointer(Faker.shared)()
        let f = fFunctionPointer(Faker.shared)("", "")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        cell?.textLabel?.text = self.dataSource[indexPath.item].name
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let showDescriptionWithIndex = produceIndexShowDescription(index: indexPath.item)
        switch self.mode {
        case .admin:
            showDescriptionWithIndex(.admin)
        case .banned, .restricted:
            showDescriptionWithIndex(.notEnoughRights)
        case .default:
            showDescriptionWithIndex(.default)
        }
    }
    
    func produceIndexShowDescription(index: Int) -> (DescriptionViewStyle) -> Void {
        return {
            self.showDescriptionView(index: index, style: $0)
        }
    }
}

private extension ViewController {
    func showDescriptionView(index: Int, style: DescriptionViewStyle) {
        //showing awesome view
        
        if style == .admin {
            self.showUserCreationForm()
        }
    }
    
    func showUserCreationForm() {
        //get callback
        let user = self.createUser(id: "das", name: "dasdas")
        user.flatMap(DataBaseManager.shared.saveUser)
    }
    
    func createUser(id: String, name: String) -> User? {
        guard DataBaseManager.shared.checkIfIdUnique(id: id) else { return nil }
        return User(name: name)
    }
}
