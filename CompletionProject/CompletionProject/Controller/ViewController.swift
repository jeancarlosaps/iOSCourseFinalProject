//
//  ViewController.swift
//  CompletionProject
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 30/01/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  // MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  // MARK: Extensions
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellIdentifier = "gameCell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    
    // Modificar o conteúdo da célula
    return cell
  }
  
}
