// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/swap.sol";
import "../src/mangoToken.sol";
import "../src/orangeToken.sol";

contract swapTest is Test {
    swapTokens swap;
    mangoToken token1;
    orangeToken token2;

    /**
     * @notice the setup is as follows-
     * 1. Mango token(token1) contract is created with supply of 1000000 tokens
     * 2. Orange token(token2) contract is created with supply of 1000000 tokens
     * 3. the swap ratio is defined as 1:10, or for every 10 Mango tokens, 1 orange token is released
     */

    function setUp() external {
        vm.startPrank(address(1));
        token1 = new mangoToken(1000000 ether);
        token2 = new orangeToken(1000000 ether);
        swap = new swapTokens(address(token1), address(token2), 10);
    }

    /**
     * @notice the test procedure of swap of mango token to orange is as follows-
     * 1. address(4) is given 100 Mango tokens (token1)
     * 2. swap contract is given 1000 Orange tokens (token2)
     * 3. address(4) approves spending
     * 4. The tokens are swapped
     */
    function testSwapToken1() external {
        token1.transfer(address(4), 1000 ether);
        token2.transfer(address(swap), 1000 ether);
        vm.startPrank(address(4));
        token1.approve(address(swap), 1000000 ether);
        console.log("<----- token1 balance before transfer of contract ----->", token1.balanceOf(address(swap)));
        console.log("<----- token2 balance before transfer of address(4) ----->", token2.balanceOf(address(4)));
        swap.swapToken1ToToken2(10 ether);
        console.log("<----- token1 balance after transfer of contract ----->", token1.balanceOf(address(swap)));
        console.log("<----- token2 balance after transfer of address(4) ----->", token2.balanceOf(address(4)));
    }

    /**
     * @notice the test procedure of swap of Orange token to Mango is as follows-
     * 1. address(4) is given 100 Orange tokens (token2)
     * 2. swap contract is given 1000 Mango tokens (token1)
     * 3. address(4) approves spending
     * 4. The tokens are swapped
     */
    function testSwapToken2() external {
        token2.transfer(address(4), 1000 ether);
        token1.transfer(address(swap), 1000 ether);
        vm.startPrank(address(4));
        token2.approve(address(swap), 1000000 ether);
        console.log("<----- token2 balance before transfer of contract ----->", token2.balanceOf(address(swap)));
        console.log("<----- token1 balance before transfer of address(4) ----->", token1.balanceOf(address(4)));
        swap.swapToken2ToToken1(10 ether);
        console.log("<----- token2 balance after transfer of contract ----->", token2.balanceOf(address(swap)));
        console.log("<----- token1 balance after transfer of address(4) ----->", token1.balanceOf(address(4)));
    }

    /**
     * @notice test to swap token1 when insufficient balance is present
     * @dev function would revert with "insufficient token1 balance" message
     */
    function testSwapToken1Fail() external {
        token1.transfer(address(4), 10 ether);
        token2.transfer(address(swap), 1000 ether);
        vm.startPrank(address(4));
        token1.approve(address(swap), 1000000 ether);
        vm.expectRevert("insufficient token1 balance");
        swap.swapToken1ToToken2(100 ether);
    }

    /**
     * @notice test to swap token2 when insufficient balance is present
     * @dev function would revert with "insufficient token2 balance" message
     */
    function testSwapToken2Fail() external {
        token2.transfer(address(4), 100 ether);
        token1.transfer(address(swap), 1000 ether);
        vm.startPrank(address(4));
        token2.approve(address(swap), 1000000 ether);
        vm.expectRevert("insufficient token2 balance");
        swap.swapToken2ToToken1(1000 ether);
    }
}
