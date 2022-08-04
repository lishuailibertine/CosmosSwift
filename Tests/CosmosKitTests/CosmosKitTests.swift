import XCTest
@testable import CosmosKit
@testable import Bech32

final class CosmosKitTests: XCTestCase {
    var request:CosmosHttpRequest {
        var r = CosmosHttpRequest.shared
        r.url = "https://lcd-inj-app.cosmostation.io"
        return r
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
    }
    struct test1 {
        var he: String?
    }
    func testBalances() {
        let expection = expectation(description: "testGRPC")
        request.getBalance(address: "cosmos1njg8uq4ek9y9fvgw59t8qdtrka8tz0aef5gnk4").done { balances in
            print(balances)
            expection.fulfill()
        }.catch { error in
            print(error)
            expection.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    func testAccount() {
        let expection = expectation(description: "testGRPC")
        request.getAccountDic(address: "inj1696nhkzleg2pexcvwflm39kyhe4n2nwaqz689g").done { balances in
            print(balances)
            expection.fulfill()
        }.catch { error in
            print(error)
            expection.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
}
