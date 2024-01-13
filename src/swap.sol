// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
/**
 * @title swapToken
 * @notice contract to swap ERC20 tokens at predefined price
 * @author Abhijay Paliwal
 */

contract swapTokens {
    receive() external payable {}

    /**
     * @notice contract address of first token(token1)
     */
    address public token1Addr;

    /**
     * @notice contract address of second token(token2)
     */
    address public token2Addr;

    /**
     * @notice predifined price of token2 in terms of token1
     */
    uint256 public priceToken2;

    event swapToken1ToToken2Event(address indexed _to, uint256 _token1Amount, uint256 _token2ReleasedAmount);
    event swapToken2ToToken1Event(address indexed _to, uint256 _token2Amount, uint256 _token1ReleasedAmount);

    /**
     * @dev Contract constructor
     * @param _token1Addr contract address of first token(token1)
     * @param _token2Addr contract address of second token(token2)
     * @param _priceToken2 predifined price of token2 in terms of token1
     */
    constructor(address _token1Addr, address _token2Addr, uint256 _priceToken2) {
        token1Addr = _token1Addr;
        token2Addr = _token2Addr;
        priceToken2 = _priceToken2;
    }
    /**
     * @notice swap token1 to token2 at predefined price
     * @param _amount uint256 amount of token1 to swap
     */

    function swapToken1ToToken2(uint256 _amount) external {
        IERC20 token1 = IERC20(token1Addr);
        IERC20 token2 = IERC20(token2Addr);
        uint256 _token2transfer = _amount / priceToken2;
        require(token1.balanceOf(msg.sender) >= _amount, "insufficient token1 balance");
        require(token2.balanceOf(address(this)) >= _token2transfer, "insufficient balance to swap");
        token1.transferFrom(msg.sender, address(this), _amount);
        token2.approve(msg.sender, _token2transfer);
        token2.transfer(msg.sender, _token2transfer);
        emit swapToken1ToToken2Event(msg.sender, _amount, _token2transfer);
    }
    /**
     * @notice swap token2 to token1 at predefined price
     * @param _amount uint256 amount of token1 to swap
     */

    function swapToken2ToToken1(uint256 _amount) external {
        IERC20 token1 = IERC20(token1Addr);
        IERC20 token2 = IERC20(token2Addr);
        uint256 _token1transfer = _amount * priceToken2;
        require(token2.balanceOf(msg.sender) >= _amount, "insufficient token2 balance");
        require(token1.balanceOf(address(this)) >= _token1transfer, "insufficient balance to swap");
        token2.transferFrom(msg.sender, address(this), _amount);
        token1.approve(msg.sender, _token1transfer);
        token1.transfer(msg.sender, _token1transfer);
        emit swapToken2ToToken1Event(msg.sender, _amount, _token1transfer);
    }
}
