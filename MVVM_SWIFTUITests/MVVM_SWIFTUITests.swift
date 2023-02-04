//
//  MVVM_SWIFTUITests.swift
//  MVVM_SWIFTUITests
//
//  Created by Renato on 04/02/23.
//

@testable import MVVM_SWIFTUI
import XCTest

final class MVVM_SWIFTUITests: XCTestCase {
    
    private var viewModel: LoginViewModel! //Subjetc under Test
    
    override func setUp() {
        super.setUp()
        viewModel = .init()
    }
    
    func testDefaultInitialState() {
        XCTAssertEqual(viewModel.state, LoginViewState(email: "", password: "", isLoggingIn: false, isShowingErrorAlert: false))
        XCTAssertFalse(viewModel.state.canSubmit)
        XCTAssert(viewModel.state.footerMessage.isEmpty)
    }

    func testSuccessfullLoginFlow() {
        viewModel.bindings.email.wrappedValue = "renato.dias@staki.com.br"
        viewModel.bindings.password.wrappedValue = "conector"
        XCTAssert(viewModel.state.canSubmit)
        XCTAssert(viewModel.state.footerMessage.isEmpty)
        viewModel.login()
        XCTAssertEqual(viewModel.state, LoginViewState(
        email: "renato.dias@staki.com.br",
        password: "conector",
        isLoggingIn: true,
        isShowingErrorAlert: false
        ))
        
        XCTAssertFalse(viewModel.state.canSubmit)
        XCTAssertEqual(viewModel.state.footerMessage, LoginViewState.isLogingInFooter )
        
        XCTFail()
    }
    func testFailedLoginFlow() {
        XCTFail()
    }
}
