import XCTest
@testable import CosmosKit
@testable import Bech32

final class CosmosKitTests: XCTestCase {
    var request:CosmosHttpRequest {
        var r = CosmosHttpRequest.shared
//        r.url = "https://lcd-inj-app.cosmostation.io"
        return r
    }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
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
    
    func testBlock(){
        let expection = expectation(description: "testGRPC")
        request.getLastBlock(path: "/cosmos/base/tendermint/v1beta1" + CosmosRequestPath.Blocks_Latest.rawValue).done { block in
            print(block)
            expection.fulfill()
        }.catch { error in
            print(error)
            expection.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    func testAccount() {
        let expection = expectation(description: "testGRPC")
        request.getAccount(address: "cosmos1njg8uq4ek9y9fvgw59t8qdtrka8tz0aef5gnk4").done { balances in
            print(balances)
            expection.fulfill()
        }.catch { error in
            print(error)
            expection.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    func testDic(){
        let dic = ["1":["2":["3":"ok"]]]
        print(dic.valueFor(key: "3") ?? "not found")
    }
}
