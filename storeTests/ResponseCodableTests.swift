////
////  ResponseCodableTests.swift
////  storeTests
////
////  Created by Никита Алимпиев on 28.06.2022.
////
//
//import XCTest
//
//struct PostStub: Codable {
//    let userId: Int
//    let id: Int
//    let title: String
//    let body: String
//    }
//
//enum ApiErrorStub: Error {
//    case fatalError
//    }
//
//struct ErrorParserStub: AbstractErrorParser {
//    func parse(_ result: Error) -> Error {
//        return ApiErrorStub.fatalError
//    }
//    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
//        return error
//    }
//}
//
//class ResponseCodableTests: XCTestCase {
//    let expectation = XCTestExpectation(description: "Download https://jsonplaceholder.typicode.com/posts/1")
//    var errorParser: ErrorParserStub!
//
//    override func setUpWithError() throws {
//
//        super.setUp()
//        errorParser = ErrorParserStub()
//        continueAfterFailure = false
//
//    }
//
//    override func tearDownWithError() throws {
//
//        super.tearDown()
//        errorParser = nil
//
//    }
//
//    func testShouldDownloadAndParse() throws {
//        // UI tests must launch the application that they test.
////        let app = XCUIApplication()
////        app.launch()
////        let errorParser = ErrorParserStub()
//
//        Alamofire
//        .request("https://jsonplaceholder.typicode.com/posts/1")
//        .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<PostStub>) in
//            switch response.result {
//            case .success(_): break
//            case .failure:
//            XCTFail() }
//        }
//        self?.expectation.fulfill()
//        }
//        wait(for: [expectation], timeout: 10.0)
//    }
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
