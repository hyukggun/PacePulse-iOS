import XCTest
@testable import PacePulseClient

class PacePulseClientTests: XCTestCase {

    var client: PacePulseClient!

    override func setUpWithError() throws {
        // Initialize the PacePulseClient before each test
        client = PacePulseClient()
    }

    override func tearDownWithError() throws {
        // Clean up after each test
        client = nil
    }

//    func testSignUpWithEmail() async throws {
//        // Test the sign-up functionality with a valid email and password
//        let email = "rhkdgus0826@gmail.com"
//        let password = "rhkdgus0826"
//        
//        
//        do {
//            try await client.signUpWithEmail(email: email, password: password)
//        } catch {
//            XCTFail(error.localizedDescription)
//        }
//    }
    
    func testSignInWithEmail() async {
        let email = "rhkdgus0826@gmail.com"
        let password = "rhkdgus0826"
        
        
        let signInResult = await client.signInWithEmail(email: email, password: password)
        
        XCTAssertTrue(signInResult)
    }
    
    func testSignOut() async {
        let client = PacePulseClient()
        let signOutResult = await client.signOut()
        XCTAssertTrue(signOutResult)
    }
    
}
