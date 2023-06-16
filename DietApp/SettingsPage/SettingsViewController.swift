//
//  SettingsViewController.swift
//  DietApp
//
//  Created by 川島真之 on 2023/05/23.
//

import UIKit

class SettingsViewController: UIViewController {
  var settingsView = SettingsView()
  //回転を許可するかどうかを決める
  //デバイスの向きが変更されたときに呼び出される
  override var shouldAutorotate: Bool {
    UIDevice.current.setValue(1, forKey: "orientation")
    return false
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
  
  var TableViewCellHeight:CGFloat = 60.0
  //cell周り設定用の列挙体
  enum SettingPageCell:Int {
    case themeColorTableViewCell = 0
    case notificationTableViewCell
  }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      settingsView.tableView.delegate = self
      settingsView.tableView.dataSource = self
      settingsView.navigationBar.delegate = self
      //セルの区切り線を左端まで伸ばす
      settingsView.tableView.separatorInset = UIEdgeInsets.zero
      //navigationBarのタイトルの設定
      settingsView.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Thonburi-Bold", size: 20)!]
      //スクロールできないようにする
      settingsView.tableView.isScrollEnabled = false
      //セルの高さの自動設定
      settingsView.tableView.rowHeight = UITableView.automaticDimension
    }
  
  override func loadView() {
    super.loadView()
    view = settingsView
  }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//navigationBarの設定
extension SettingsViewController: UINavigationBarDelegate {
  //navigationBarをステータスバーを覆うように表示
  func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .topAttached
  }
}
//tableViewの設定
extension SettingsViewController: UITableViewDelegate,UITableViewDataSource {
  //セル数の設定
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  //各セルの内容の設定
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = SettingPageCell(rawValue: indexPath.row)
    
    switch (cell)! {
    case .themeColorTableViewCell:
      let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeColorTableViewCell", for: indexPath) as! ThemeColorTableViewCell
      //セルの選択時のハイライトを非表示にする
      cell.selectionStyle = UITableViewCell.SelectionStyle.none
      return cell
      
    case .notificationTableViewCell:
      let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
      cell.selectionStyle = UITableViewCell.SelectionStyle.none
      return cell
    }
  }
  //セルの高さの推定値の設定
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return TableViewCellHeight
  }
  //セルの高さを設定
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return TableViewCellHeight
  }
}
