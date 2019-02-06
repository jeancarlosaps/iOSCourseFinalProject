//
//  UIImageView+download.swift
//  CompletionProject
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 04/02/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit
import ObjectiveC

// FONTE: https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift

private var associationKey: UInt8 = 0

extension UIImageView {
  
  var currentLine: Int {
    get {
      return objc_getAssociatedObject(self, &associationKey) as! Int// & = endereço de memória da variável.
    }
    
    set(newValue) {
      objc_setAssociatedObject(self, &associationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
  }
  
  func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit, currentLine: Int) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
    self.currentLine = currentLine
    contentMode = mode
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard
        let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
        let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
        let data = data, error == nil,
        let image = UIImage(data: data)
        else { return }
      
      if currentLine == self.currentLine{
        DispatchQueue.main.async() {
          self.image = image
        }
      }
      
      }.resume()
  }
  
  func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit, currentLine: Int) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
    guard let url = URL(string: link) else { return }
    downloaded(from: url, contentMode: mode, currentLine: currentLine)
  }
}
