pragma solidity ^0.4.0;

contract AddressBook {
    mapping(address => string) public records;
    address  owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function set(string name) public payable {
        require(msg.value == 10**17);
        records[msg.sender] = name;
    }
    
    function withdrow () public {
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
    }
    
}

