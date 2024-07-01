// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract Token  {

    uint256 private _totalSupply;
    address public owner;
    mapping(address => uint256) private _balances;

    constructor(uint256 initial_tokens){
        owner = msg.sender;
        _balances[owner]+=initial_tokens;
        _totalSupply+=initial_tokens;
    }

    modifier onlyUser(){
        require(msg.sender==owner,"sender is not the owner");
        _;
    }
    modifier sufficientAmount(uint256 amount){
        if(amount >_balances[msg.sender]){
            revert("insufficient funds");
        }
        _;
    }

    function mint(uint256 amount) public  onlyUser{
        _totalSupply+=amount;
        _balances[owner]+=amount;
    }

    function transfer(address to, uint256 amount) public sufficientAmount(amount) {
        _balances[msg.sender]-=amount;
        _balances[to]+=amount;
    }

    function burn(uint256 amount) public sufficientAmount(amount) {
        _balances[msg.sender]-=amount;
        _totalSupply-=amount;
    }

    function balance(address user) public view returns(uint256){
        return _balances[user];
    }

    function totalSupply() public view returns(uint256){
        return _totalSupply;
    }

    
}
