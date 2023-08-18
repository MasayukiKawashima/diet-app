//
//  GraphContentCreatorTests.swift
//  DietAppTests
//
//  Created by 川島真之 on 2023/07/23.
//

import XCTest
import RealmSwift
import Charts
@testable import DietApp

class GraphContentCreatorTests: XCTestCase {
  
  var inMemoryRealm: Realm!
  
  override func setUp() {
    super.setUp()
    // インメモリのRealmを初期化
    let inMemoryRealmConfiguration = Realm.Configuration(inMemoryIdentifier: "inMemoryRealm")
    self.inMemoryRealm = try! Realm(configuration: inMemoryRealmConfiguration)

    let dateString = "2023-07-16"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: dateString)!
    
    // テストデータを作成して保存
    try! self.inMemoryRealm.write {
      let dateData = DateData()
      dateData.date = date
      dateData.weight = 80.5
      self.inMemoryRealm.add(dateData)
    }
  }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

  override func tearDown() {
      // インメモリのRealmを削除
      try! self.inMemoryRealm.write {
        self.inMemoryRealm.deleteAll()
      }
      
      self.inMemoryRealm = nil
      
      super.tearDown()
    }
  
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
//createDataEntry()のテスト
//月の前半の場合のテスト
  func testCreateDataEntryBefore17() {
    let dateString = "2023-07-16"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: dateString)!
    
    let graphContentCreator = GraphContentCreator(realm: self.inMemoryRealm, currentDate: date)
    let result = graphContentCreator.createDataEntry(index: 0)
    XCTAssertEqual(result.count, 1)
    XCTAssertEqual(result[0].y, 80.5)
  }
  
  //月の後半の場合のテスト
  func testCreateDataEntryAfter17() {
    let dateString = "2023-07-17"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: dateString)!
    
    let graphContentCreator = GraphContentCreator(realm: self.inMemoryRealm, currentDate: date)
    let result = graphContentCreator.createDataEntry(index: 1)
    XCTAssertEqual(result.count, 0)
  }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
