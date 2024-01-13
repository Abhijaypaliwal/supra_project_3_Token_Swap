# README for swapTokens Smart Contract

## 1. Solidity Code:

The provided Solidity code (`swapTokens.sol`) implements a smart contract named `swapTokens`. This contract facilitates the swapping of ERC20 tokens at a predefined price. It includes functionality for swapping token1 to token2 and vice versa.

## 2. Design Choices:

### 2.1 Token Swapping Mechanism:
The contract employs the ERC20 standard to interact with Token1 and Token2, ensuring compatibility with various ERC20 tokens.  
Users initiate swaps by calling the swapToken1ToToken2 or swapToken2ToToken1 functions, specifying the amount to be swapped.  
The conversion rate (priceToken2) is predefined and dictates the exchange ratio between Token1 and Token2.

### 2.2 Safety Measures:
The contract checks user balances and contract balances before executing swaps, preventing swaps with insufficient balances.   
ERC20 approval mechanisms are used to ensure secure token transfers and protect against potential misuse.   
Events (swapToken1ToToken2 and swapToken2ToToken1) are emitted to log successful swap transactions, facilitating transparency.   

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
