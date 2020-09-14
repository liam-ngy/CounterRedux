import XCTest
@testable import Counter

class TransactionReducerTests: XCTestCase {
  func test_transactionReducer_whenWithdraw_expectBalanceToBe1() {
    // Given
    let transactionState = TransactionState(balance: 2)
    
    // When
    let transactionStateUnderTest = TransactionReducer.makeTransactionState(transactionState, .withdraw)
    
    // Then
    XCTAssertEqual(transactionStateUnderTest, .init(balance: 1))
    
  }
  
  func test_transactionReducer_whenWithdraw_expectBalanceToBe0() {
    // Given
    let transactionState = TransactionState(balance: 1)
    
    // When
    let transactionStateUnderTest = TransactionReducer.makeTransactionState(transactionState, .withdraw)
    
    // Then
    XCTAssertEqual(transactionStateUnderTest, .init(balance: 0))
  }
  
  func test_transactionReducer_whenDeposit_expectBalanceToBe1() {
    // Given
    let transactionState = TransactionState(balance: 0)
    
    // When
    let transactionStateUnderTest = TransactionReducer.makeTransactionState(transactionState, .deposit)
    
    // Then
    XCTAssertEqual(transactionStateUnderTest, .init(balance: 1))
  }
}