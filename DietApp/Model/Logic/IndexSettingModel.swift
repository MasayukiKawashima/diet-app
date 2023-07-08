//
//  IndexSettingModel.swift
//  DietApp
//
//  Created by 川島真之 on 2023/07/08.
//

import Foundation

class IndexSettingModel {
  //月の前半か後半かによるindexの調整を行うメソッド
  //現在の日付が17日以降ならindexに1を返す
  func indexSetting() -> Int {
    let currentDate = Date()
    let calendar = Calendar.current
    let components = calendar.dateComponents([.day, .month], from: currentDate)
    if let day = components.day {
      if day >= 17 {
        return 1
      }
    }
    return 0
  }
}
