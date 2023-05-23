//
//  TopPageViewController.swift
//  DietApp
//
//  Created by 川島真之 on 2023/05/23.
//

import UIKit

class TopPageViewController: UIPageViewController {
  
  private var controllers: [UIViewController] = []
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.initTopPageViewContoller()
      
        // Do any additional setup after loading the view.
    }
  
  private func initTopPageViewContoller() {
    
    let topVC = storyboard!.instantiateViewController(withIdentifier: "TopView") as! TopViewController
    
    self.controllers = [topVC]
    
    setViewControllers([self.controllers[0]], direction: .forward, animated: true, completion: nil)
    
    self.dataSource = self
  }
}

extension TopPageViewController: UIPageViewControllerDataSource {
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return self.controllers.count
  }
  
  //2023.5.23スワイプ時処理は保留
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    return nil
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    return nil
  }
  
  
}