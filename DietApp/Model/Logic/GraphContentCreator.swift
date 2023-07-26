//
//  GraphContentCreator.swift
//  DietApp
//
//  Created by 川島真之 on 2023/07/17.
//

import Foundation
import RealmSwift
import Charts

class GraphContentCreator {
  
  private let realm: Realm!
  
  init(realm: Realm = try! Realm()){
    self.realm = realm
  }
  //エントリーポイントを作成するメソッド
  func createDataEntry(index: Int) -> [ChartDataEntry] {
  
    let calendar = Calendar.current
    //現在の日付を取得
    let date = Date()
    //月の更新
    let value = (index - 1)/2
    let modifiedDate = calendar.date(byAdding: .month, value: value, to: date)!
  
    //現在の日付の月と年を取得
    let month = calendar.component(.month, from: modifiedDate)
    let year = calendar.component(.year, from: modifiedDate)
    
    let dateRangeCalculator = DateRangeCalculator()
    let results = dateRangeCalculator.calculateMonthHalfDayRange(index: index)

    var dataEntries: [ChartDataEntry] = []
    
    for day in results.startDay...results.endDay {
      //現在の年、月、日を表すDateを作成。時間はその日の開始時刻(0時0分0秒）を取得。
      let startOfCurrentDay = calendar.date(from: DateComponents(calendar: calendar, timeZone: TimeZone.current, year: year, month: month, day: day))!
      //startOfCurrentDayに1日を足した日を作成。時間は開始時刻。
      let startOfNextDay = calendar.date(byAdding: .day, value: 1, to: startOfCurrentDay)!
      // 指定した日付のエントリを検索
      let results = self.realm.objects(DateData.self)
        .filter("date >= %@ && date < %@ && weight != 0", startOfCurrentDay, startOfNextDay)

      // すべての結果をループし、チャートエントリーを作成
      for result in results {
        let entry = ChartDataEntry(x: Double(day), y: result.weight)
          dataEntries.append(entry)
      }
    }
    return dataEntries
  }
}
