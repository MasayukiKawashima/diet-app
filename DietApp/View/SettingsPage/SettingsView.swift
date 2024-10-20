//
//  SettingsView.swift
//  DietApp
//
//  Created by 川島真之 on 2023/06/09.
//

import UIKit

class SettingsView: UIView {
  
  let cellIdentifiers = ["ThemeColorTableViewCell","NotificationTableViewCell"]
  
  @IBOutlet weak var tableView: UITableView!{
    didSet{
      //各セルの登録
      for identifier in cellIdentifiers {
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    nibInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    nibInit()
  }
  
  func nibInit() {
    //xibファイルのインスタンス作成
    let nib = UINib(nibName: "SettingsView", bundle: nil)
    guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
    //viewのサイズを画面のサイズと一緒にする
    view.frame = self.bounds
    //サイズの自動調整
    view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    
    self.addSubview(view)
  }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
