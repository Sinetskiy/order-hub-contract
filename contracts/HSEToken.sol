pragma solidity ^0.4.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract HSEToken is MintableToken {
    string public constant name = "HSE TOKEN";
    string public constant symbol = "HSE";
    uint public constant decimals = 18;
}