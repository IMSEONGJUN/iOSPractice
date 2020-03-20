//
//  ShoppingBagViewController.swift
//  SmartPhoneShop
//
//  Created by SEONGJUN on 2019/12/27.
//  Copyright © 2019 Seongjun Im. All rights reserved.
//

import UIKit

class ShoppingBagViewController: UIViewController {

    let tableView = UITableView()
    let totalPriceLabelOnFooter = UILabel()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "장바구니"
        totalPriceLabelOnFooter.backgroundColor = .lightGray
        totalPriceLabelOnFooter.textAlignment = .center
        configureTableView()
        setBarButtonItems()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        tableView.pin(to: view?.safeAreaLayoutGuide)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.register(ItemCell.self, forCellReuseIdentifier: "CellId")
        tableView.rowHeight = 150
        tableView.dataSource = self
        tableView.delegate = self
        
        let refreshController = UIRefreshControl()
        refreshController.tintColor = .blue
        refreshController.attributedTitle = NSAttributedString(string: "Refreshing...", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13)])
        refreshController.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = refreshController
    }
    
    func setBarButtonItems() {
        let resetButtonLeft = UIBarButtonItem(title: "reset", style: .plain, target: self, action: #selector(didTapLeftBarResetButton))
        navigationItem.leftBarButtonItem = resetButtonLeft
        
        let orderButtonRight = UIBarButtonItem(title: "order", style: .plain, target: self, action: #selector(didTapRightBarOrderButton))
        navigationItem.rightBarButtonItem = orderButtonRight
    }
    
    @objc func didTapLeftBarResetButton(_ sender: UIButton) {
        SingletonData.shared.pickedItems.removeAll()
        reloadData()
    }
    
    @objc func didTapRightBarOrderButton() {
        guard !SingletonData.shared.pickedItems.isEmpty else {
            simpleAlert(message: "장바구니가 비어있습니다")
            return
        }
        let ov = OrderViewController()
        let totalPriceToPayArr = SingletonData.shared.pickedItems.map{$0.itemPrice * $0.itemCount}
        let totalPriceToPayValue = totalPriceToPayArr.reduce(into: 0, {$0 += $1})
        ov.amountToPay = totalPriceToPayValue
        navigationController?.pushViewController(ov, animated: true)
    }
    
    @objc func reloadData() {
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }

    

}

extension ShoppingBagViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SingletonData.shared.pickedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath) as! ItemCell
        let item = SingletonData.shared.pickedItems[indexPath.row]
        cell.setForShoppingBagList(item: item)
        
        return cell
    }
    
    
}
extension ShoppingBagViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let totalPriceValue = SingletonData.shared.pickedItems.map{$0.itemCount * $0.itemPrice}.reduce(into: 0, {$0 += $1})
        
        let containerView = UIView()
        containerView.addSubview(totalPriceLabelOnFooter)
        totalPriceLabelOnFooter.translatesAutoresizingMaskIntoConstraints = false
        totalPriceLabelOnFooter.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        totalPriceLabelOnFooter.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 200).isActive = true
        totalPriceLabelOnFooter.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30).isActive = true
        totalPriceLabelOnFooter.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        totalPriceLabelOnFooter.backgroundColor = .yellow
        totalPriceLabelOnFooter.text = "Total Price : $\(totalPriceValue)"
        return containerView
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, actionPerformed) in
            SingletonData.shared.pickedItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            actionPerformed(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        tableView.reloadData()
    }
}
