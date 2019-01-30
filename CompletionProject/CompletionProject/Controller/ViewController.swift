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
  var elements = [1,2,3,4,5,6]
  
  // MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  // MARK: - Internal Methods
  func loadDada() {
    let newListElements = [7,8,9,10,11,12,13]
    elements.append(contentsOf: newListElements)
    
    // reload data in tableview
    tableView.reloadData()
  }
  
  // MARK: TableView DataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return elements.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "gameCell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    
    // Modificar o conteúdo da célula
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
