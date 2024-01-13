
## Test Cases Overview

The provided Solidity code includes comprehensive test cases to ensure the correct functionality and robustness of the `swapTokens` smart contract. The tests cover both typical usage scenarios and edge cases, providing a thorough evaluation of the contract's behavior.

## Test 1: Swap Mango Token to Orange Token

### Procedure:
1. Address(4) receives 100 Mango tokens (token1).
2. The swap contract is given 1000 Orange tokens (token2).
3. Address(4) approves spending.
4. The `swapToken1ToToken2` function is called to swap 10 Mango tokens for Orange tokens.

### Expected Results:
- Successful execution of the swap operation.
- Balances before and after the transfer are logged for verification.

## Test 2: Swap Orange Token to Mango Token

### Procedure:
1. Address(4) receives 100 Orange tokens (token2).
2. The swap contract is given 1000 Mango tokens (token1).
3. Address(4) approves spending.
4. The `swapToken2ToToken1` function is called to swap 10 Orange tokens for Mango tokens.

### Expected Results:
- Successful execution of the swap operation.
- Balances before and after the transfer are logged for verification.

## Test 3: Insufficient Balance for Swap (Token1)

### Procedure:
1. Address(4) receives 10 Mango tokens (token1).
2. The swap contract is given 1000 Orange tokens (token2).
3. Address(4) approves spending.
4. The `swapToken1ToToken2` function is called to swap 100 Mango tokens (insufficient balance).

### Expected Results:
- Revert with the message "insufficient token1 balance."

## Test 4: Insufficient Balance for Swap (Token2)

### Procedure:
1. Address(4) receives 100 Orange tokens (token2).
2. The swap contract is given 1000 Mango tokens (token1).
3. Address(4) approves spending.
4. The `swapToken2ToToken1` function is called to swap 1000 Orange tokens (insufficient balance).

### Expected Results:
- Revert with the message "insufficient token2 balance."
