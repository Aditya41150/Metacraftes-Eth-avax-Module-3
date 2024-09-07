// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Mtoken is ERC20 {
    address public owner;

    // Modifier to restrict access to only the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    // Constructor sets the token name, symbol, and mints initial supply to the contract owner
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
        _mint(msg.sender, 100 * 10**uint(decimals()));  // Initial mint to contract owner(100000000000000000000)
    }

    // Function to mint tokens, restricted to contract owner
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);  // Corrected mint function to include recipient address
    }

    // Function to burn tokens, anyone can call this to burn their own tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);  // Burn tokens from the caller's account
    }
}
