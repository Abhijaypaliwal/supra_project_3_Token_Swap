# README for swapTokens Smart Contract

## 1. Solidity Code:

The provided Solidity code (`swapTokens.sol`) implements a smart contract named `swapTokens`. This contract facilitates the swapping of ERC20 tokens at a predefined price. It includes functionality for swapping token1 to token2 and vice versa.

## 2. Design Choices:

### Contract Structure:

1. **Constructor Parameters:**
    - `_token1Addr`: The contract address of the first token (token1).
    - `_token2Addr`: The contract address of the second token (token2).
    - `_priceToken2`: The predefined price of token2 in terms of token1.

2. **State Variables:**
    - `token1Addr`: Stores the contract address of token1.
    - `token2Addr`: Stores the contract address of token2.
    - `priceToken2`: Stores the predefined price of token2 in terms of token1.

3. **Events:**
    - `swapToken1ToToken2`: Emitted when a user swaps token1 for token2.
    - `swapToken2ToToken1`: Emitted when a user swaps token2 for token1.

### Swap Functions:

1. **`swapToken1ToToken2` Function:**
    - Allows users to swap token1 for token2 at the predefined price.
    - Checks user balances and contract balance before proceeding with the swap.
    - Emits `swapToken1ToToken2` event upon successful swap.

2. **`swapToken2ToToken1` Function:**
    - Allows users to swap token2 for token1 at the predefined price.
    - Checks user balances and contract balance before proceeding with the swap.
    - Emits `swapToken2ToToken1` event upon successful swap.

## 3. Security Considerations:

1. **Balance Checks:**
    - Before executing any swap, the contract checks user balances and contract balances to ensure that there are sufficient funds for the swap.

2. **Approval Mechanism:**
    - The contract uses the `approve` mechanism to allow the contract to transfer tokens on behalf of the user.

3. **Reentrancy Protection:**
    - The contract is designed to prevent reentrancy attacks by ensuring that external calls are made after internal state changes.

4. **External Dependencies:**
    - This contract relies on the ERC20 interface (`IERC20`) for interacting with token contracts. It assumes that the provided token contracts adhere to the ERC20 standard.

5. **Visibility Modifiers:**
    - The contract uses appropriate visibility modifiers to control access to functions. For example, the `swapToken1ToToken2` and `swapToken2ToToken1` functions are external, ensuring they can only be called from outside the contract.
