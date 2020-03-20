//
//  MainViewController.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/27.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import UIKit

struct CellId {
    static var itemCell = "CellID"
}


class MainViewController: UIViewController {
    
    var leftbarTitle = ""
    let tableView = UITableView()
    var data = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Products List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.data = fetchData()
        setupTableView()

        let leftBarItemLogOut = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogOutButton(_:)))
        let leftBarItemID = UIBarButtonItem()
        leftBarItemID.title = leftbarTitle
        navigationItem.leftBarButtonItems = [leftBarItemID, leftBarItemLogOut]
        
    }
    
    override func viewSafeAreaInsetsDidChange() {
        tableView.pin(to: view?.safeAreaLayoutGuide)
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150
        tableView.register(ItemCell.self, forCellReuseIdentifier: CellId.itemCell)
        view.addSubview(tableView)
    }
    
    @objc func didTapLogOutButton(_ sender:UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "loggedInID")
        UserDefaults.standard.removeObject(forKey: "loggedInPW")
        
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                window.backgroundColor = .systemBackground
                let rootVC = LoginViewController()
                window.rootViewController = rootVC
                
                let sceneDelegate = windowScene.delegate as? SceneDelegate
                sceneDelegate?.window = window
                window.makeKeyAndVisible()
            }
        } else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.backgroundColor = .systemBackground
            window.rootViewController = LoginViewController()
            window.makeKeyAndVisible()
            appDelegate.window = window
        }
    }
    
    deinit {
        print("MainView deinit")
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.itemCell, for: indexPath) as! ItemCell
        cell.accessoryType = .disclosureIndicator
        cell.setForProductList(item: self.data[indexPath.row])
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.data[indexPath.row]
        let dvc = DetailViewController()
        dvc.navigationController?.navigationBar.prefersLargeTitles = true
        dvc.item = item
        navigationController?.pushViewController(dvc, animated: true)
    }
}
