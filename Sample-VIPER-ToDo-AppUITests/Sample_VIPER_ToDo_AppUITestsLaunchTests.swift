//
//  Sample_VIPER_ToDo_AppUITestsLaunchTests.swift
//  Sample-VIPER-ToDo-AppUITests
//
//  Created by 鈴木 健太 on 2025/04/05.
//

import XCTest

final class Sample_VIPER_ToDo_AppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
