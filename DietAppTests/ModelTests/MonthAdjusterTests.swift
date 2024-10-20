//
//  MonthAdjusterTests.swift
//  DietAppTests
//
//  Created by 川島真之 on 2023/08/06.
//

import XCTest
@testable import DietApp

class MonthAdjusterTests: XCTestCase {
  
  var monthAdjuter: MonthAdjuster!
  var date: Date!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
  override func setUp() {
    super.setUp()
    
    monthAdjuter = MonthAdjuster()
    //テスト用Dateを作成
    let dateString = "2023-07-16"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    date = dateFormatter.date(from: dateString)!
  }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  //現在の月を翌月にするテスト
  func testAdjustMonthToNextMonth(){
    //翌月にするためにはindexの値が2である必要がある
    let index = 2
    let result = monthAdjuter.adjustMonth(index: index,date: date)
    
    let calendar = Calendar.current
    let month = calendar.component(.month, from: result)
    XCTAssertEqual(month, 8)
  }
  //現在の月を翌々月にするテスト
  func testAdjustMonthToTwoMonthsAhead() {
    let index = 4
    let result = monthAdjuter.adjustMonth(index: index,date: date)
    
    let calendar = Calendar.current
    let month = calendar.component(.month, from: result)
    XCTAssertEqual(month, 9)
  }
  //現在の月を前月にするテスト
  func testAdjustMonthToPreviousMonth() {
    let index = -1
    let result = monthAdjuter.adjustMonth(index: index,date: date)
    
    let calendar = Calendar.current
    let month = calendar.component(.month, from: result)
    XCTAssertEqual(month, 6)
  }
  //現在の月を前前月にするテスト
  func testAdjustMonthToTwoMonthsBefore() {
    let index = -3
    let result = monthAdjuter.adjustMonth(index: index,date: date)
    
    let calendar = Calendar.current
    let month = calendar.component(.month, from: result)
    XCTAssertEqual(month, 5)
  }
  //現在の月を維持するテスト
  func testAdjustMonthWithoutChange() {
    let index = 0
    let result = monthAdjuter.adjustMonth(index: index,date: date)
    
    let calendar = Calendar.current
    let month = calendar.component(.month, from: result)
    XCTAssertEqual(month, 7)
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
