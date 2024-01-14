//
//  SettingsNavigatonController.swift
//  DietApp
//
//  Created by 川島真之 on 2023/08/30.
//

import UIKit

class SettingsNavigatonController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
      //navigationBarのタイトルの設定
//      self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Thonburi-Bold", size: 20)!]
        // Do any additional setup after loading the view.
      navigationBarTittleSettings()
    }
}

extension SettingsNavigatonController {
  func navigationBarTittleSettings() {
    let titleText = "設定"
    
    let customTitleView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: self.navigationBar.frame.size.height))
    
    let titleTextLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 22))
    titleTextLabel.text = titleText
    titleTextLabel.font = UIFont(name: "Thonburi-Bold", size: 18.0)
    titleTextLabel.textColor = .black
    titleTextLabel.sizeToFit()
    
    titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
    
    customTitleView.addSubview(titleTextLabel)
    
    NSLayoutConstraint.activate([
      titleTextLabel.centerXAnchor.constraint(equalTo: customTitleView.centerXAnchor),
      titleTextLabel.centerYAnchor.constraint(equalTo: customTitleView.centerYAnchor)
    ])
    self.navigationItem.titleView = customTitleView
  }
}
