pragma solidity ^0.4.0;

import "./Order.sol";
contract OrdersHub 
{
    address owner;

    constructor() public {
        owner = msg.sender;
    }

    Order[] public orders;

    function makeOrder(address addresExecuter, address[3] auditors, uint finishTime,string DocsHash) public payable {
        Order order = (new Order).value(msg.value)(msg.sender, addresExecuter, auditors, finishTime, DocsHash);
        orders.push(order);
    }
    
}