//
//  ViewController.swift
//  CompletionProject
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 30/01/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  // MARK: - Properties
  var elements = [AppInfo]()
  var referenceDatabase: DatabaseReference!
  
  // MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    referenceDatabase = Database.database().reference()
    
    // Get database elements
    uploadData()
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  // MARK: - Internal Methods
  func uploadData() {
    let folderApps = referenceDatabase.child("apps")
    
    folderApps.queryOrderedByKey()
    folderApps.queryStarting(atValue: self.elements.count)
    folderApps.queryEnding(atValue: self.elements.count + 4)
    
    folderApps.observeSingleEvent(of: .value) { (snapShot) in
      for item in snapShot.children {
        let appInfo = AppInfo(snapShot: item as! DataSnapshot)
        self.elements.append(appInfo)
      }
      self.tableView.reloadData()
    }
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
    cell.imageGame.image = UIImage(named: "star")
    cell.imageGame.downloaded(from: appInfo.imageURL, contentMode: .scaleAspectFill, currentLine: indexPath.row)
    return cell
  }
  
  // MARK: TableView Delegate
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let lastItem = elements.count - 1
    if indexPath.row == lastItem {
      uploadData()
    }
  }
}
