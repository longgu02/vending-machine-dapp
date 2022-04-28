// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract vendingMachine{
    address public owner;
    mapping (address => uint) public snackInventory;
    constructor (){
        owner = msg.sender;
        snackInventory[address(this)] = 100;
    }

    function getSnackInventory() public view returns (uint){
        return snackInventory[address(this)];
    }

    function restock(uint amount) public {
        require(msg.sender == owner, "Only owner can restock");
        snackInventory[address(this)] += amount;
    }

    function purchase(uint amount) public payable {
        require(msg.value >= amount * 0.5 ether, "You must pay at least $0.5 ether per snack");
        require(snackInventory[address(this)] >= amount, "Not enough snack in stock to fullfill");
        snackInventory[address(this)] -= amount;
        snackInventory[msg.sender] += amount;
    }
}