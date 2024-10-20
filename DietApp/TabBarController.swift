//
//  TabBarController.swift
//  DietApp
//
//  Created by 川島真之 on 2023/05/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.delegate = self
      //TabBarの背景色の設定
      let appearance = UITabBarAppearance()
      appearance.backgroundColor =  UIColor.systemGray6
      UITabBar.appearance().standardAppearance = appearance
      UITabBar.appearance().scrollEdgeAppearance = appearance
        // Do any additional setup after loading the view.
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

extension TabBarController: UITabBarControllerDelegate {
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    //タブをグラフページに切り替えたときのグラフ描画処理
    if let graphNavigationController = viewController as? GraphNavigationController,
       let graphPageViewController = graphNavigationController.viewControllers.first as? GraphPageViewController,
       let graphViewController = graphPageViewController.viewControllers?.first as? GraphViewController {
      graphViewController.createLineChartDate()
    }
  }
}

