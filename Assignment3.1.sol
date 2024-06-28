// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleToken {

    string public tokName = "SS1";
    string public tokAbbrv = "SS";
    uint public totalSupply = 1000;

    mapping(address => uint) public balance;

    constructor() {
        balance[msg.sender] = totalSupply;
    }

    // Mint function
    function mint(address _addr, uint _vlu) public {
        // Using require() to ensure a valid address and value
        require(_addr != address(0), "Cannot mint to the zero address");
        require(_vlu > 0, "Mint value must be greater than zero");

        totalSupply += _vlu;
        balance[_addr] += _vlu;
    }

    // Burn function
    function burn(address _addr, uint _vlu) public {
        // Using require() to check sufficient balance
        require(balance[_addr] >= _vlu, "Insufficient balance to burn");

        // Using assert() to check for invariants
        uint previousBalance = balance[_addr];
        totalSupply -= _vlu;
        balance[_addr] -= _vlu;
        assert(balance[_addr] == previousBalance - _vlu);
    }

    // Function to demonstrate revert
    function triggerRevert() public pure {
        revert("This function always reverts");
    }
}
