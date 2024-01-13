pragma solidity ^0.8.16;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract orangeToken is ERC20 {
    constructor(uint256 initialSupply) public ERC20("Mango Token", "Mango") {
        _mint(msg.sender, initialSupply);
    }

    function mint(uint256 _amount) external returns (bool) {
        _mint(msg.sender, _amount);
        return true;
    }
}
