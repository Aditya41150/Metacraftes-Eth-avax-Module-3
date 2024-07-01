# METACRATERS-ETH_AVAX_Mod3
This is the repository for the 3rd assessment of METACRAFTERS ETH+AVAX COURSE

# contract.sol
to deploy this contract on your machine jsut copy the contract file to your remix IDE and use as you wish

# Token Contract
This is a simple Ethereum token contract implemented in Solidity. It allows for the creation, transfer, and burning of tokens. The contract is released under the MIT license.

# Table of Contents
-> Contract Overview
-> Usage
-> Constructor
-> Modifiers
-> Functions

# Contract Overview
The Token contract is a basic implementation of an ERC20-like token. It features the following components:

owner: The address that deploys the contract and holds the initial supply of tokens.
_balances: A mapping of addresses to their token balances.
_totalSupply: The total supply of tokens in the contract.
# Usage
Constructor
The contract constructor initializes the contract with an initial supply of tokens. The deploying address becomes the owner of the contract and holds the entire initial supply.

```constructor(uint256 initial_tokens)```

## Modifiers
```onlyUser```: This modifier restricts the execution of certain functions to the contract owner.

```sufficientAmount(uint256 amount)```: This modifier checks whether the caller's balance is sufficient for the requested transaction.

# Functions
```mint(uint256 amount) ``` : Allows the owner to mint new tokens and add them to their balance.

```transfer(address to, uint256 amount)```: Allows users to transfer tokens to another address. The caller's balance is reduced, and the recipient's balance is increased.

```burn(uint256 amount)```: Allows users to burn (destroy) a specific amount of their tokens. The caller's balance and the total supply are reduced accordingly.

```balance(address user)```: Returns the token balance of a given address.

```totalSupply()```: Returns the total supply of tokens in the contract.
