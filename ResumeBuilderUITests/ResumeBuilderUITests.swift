import XCTest

class ResumeBuilderUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasicInfo() throws {
        let app = XCUIApplication()
        app.launchArguments += ["UI-Testing"]
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery.cells.firstMatch.tap()
                
        let labels = ["Mobile Number", "Email Address", "Residence Address", "Career Objective", "Total Years of experience"]
        for label in labels {
            let textFieldElement = tablesQuery.cells.containing(.staticText, identifier: label).children(matching: .textField).element
            textFieldElement.tap()
            textFieldElement.typeText(label)
        }
        
        let formLabels = [
            "Add Work Experience": ["Company Name", "Duration"],
            "Add Skill": ["Skill"],
            "Add Education": ["Class", "Passing year", "CGPA"],
            "Add Project": ["Project Name", "Team Size", "Project Summary", "Technology used", "Role"]
        ]
        let formValues = [
            "Add Work Experience": ["Apple", "2"],
            "Add Skill": ["iOS"],
            "Add Education": ["X", "2020", "5"],
            "Add Project": ["ResumeBuilder", "1", "A Good Summary", "Swift", "Developer"]
        ]
        
        for (title, labels) in formLabels {
            tablesQuery.cells.buttons[title].tap()
            let values = formValues[title]
            
            for (index, element) in labels.enumerated() {
                let textFieldElement = tablesQuery.cells.containing(.staticText, identifier: element).children(matching: .textField).element
                textFieldElement.tap()
                
                if let value = values?[index] {
                    textFieldElement.typeText(value)
                }
            }
            
            app.navigationBars.allElementsBoundByIndex.last?.children(matching: .button).firstMatch.tap()
        }
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        tablesQuery.cells.firstMatch.tap()
        
        for label in labels {
            let textFieldElement = tablesQuery.cells.containing(.staticText, identifier:label).children(matching: .textField).element
            XCTAssertEqual(textFieldElement.value as? String, label, label + " Not Saved")
        }
        
        for (title, labels) in formLabels {
            let values = formValues[title]
            
            for (index, element) in labels.enumerated() {
                if let textElement = tablesQuery.cells.containing(.staticText, identifier: element + ":").descendants(matching: .staticText).allElementsBoundByIndex.last, let value = values?[index] {
                    XCTAssertEqual(textElement.value as? String, value, value + " Not Saved")
                }
            }
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
