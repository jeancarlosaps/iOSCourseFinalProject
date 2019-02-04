//
//  ViewController.swift
//  CompletionProject
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 30/01/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  // MARK: - Properties
  var elements = [AppInfo]()
  
  // MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let appInfo = AppInfo(name: "Soda Dungeon", price: 99, imageURL: "https://presskits.armorgames.com/game/soda-dungeon/images/SodaDungeonArt.png")
    for _ in 0..<10 {
      elements.append(appInfo)
    }
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  // MARK: - Internal Methods
  func loadDada() {
    let appInfo = AppInfo(name: "Novos Dados", price: 199, imageURL: "https://presskits.armorgames.com/game/soda-dungeon/images/SodaDungeonArt.png")
    for _ in 0..<10 {
      elements.append(appInfo)
    }
    
    // reload data in tableview
    tableView.reloadData()
  }
  
  func formatPriceInCents(price: Int) -> String {
    if price == 0 {
      return "FREE"
    }
    
    return "$\(Int(price/100)).\(price%100)"
  }
  
  // MARK: TableView DataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return elements.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "gameCell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AppTableViewCell
    
    // Modificar o conteúdo da célula
    let appInfo = elements[indexPath.row]
    cell.name.text = appInfo.name
    cell.price.text = formatPriceInCents(price: appInfo.price)
    cell.imageGame.downloaded(from: appInfo.imageURL, contentMode: .scaleAspectFill)
    return cell
  }
  
  // MARK: TableView Delegate
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let lastItem = elements.count - 1
    if indexPath.row == lastItem {
      loadDada()
    }
  }
}
