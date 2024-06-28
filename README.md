# SimpleToken Smart Contract

A simple Ethereum smart contract for minting and burning tokens.

## Description

This project provides a basic implementation of a token contract in Solidity. The `SimpleToken` contract allows for the minting and burning of tokens, demonstrating key functionalities such as state management, validation, and error handling in a smart contract.

## Getting Started

### Prerequisites

- Solidity compiler (solc)
- Ethereum development environment (e.g., Truffle, Hardhat, or Remix)

### Installing

1. Clone the repository:
    ```sh
    git clone https://github.com/your-repo/SimpleToken.git
    cd SimpleToken
    ```

2. Install dependencies (if using a framework like Truffle or Hardhat):
    ```sh
    npm install
    ```

### Executing Program

To compile and deploy the contract, follow these steps:

1. Open your Ethereum development environment (e.g., Remix).

2. Create a new file and paste the `SimpleToken` contract code:
    ```solidity
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
            require(_addr != address(0), "Cannot mint to the zero address");
            require(_vlu > 0, "Mint value must be greater than zero");

            totalSupply += _vlu;
            balance[_addr] += _vlu;
        }

        // Burn function
        function burn(address _addr, uint _vlu) public {
            require(balance[_addr] >= _vlu, "Insufficient balance to burn");

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
    ```

3. Compile the contract:
    ```sh
    solc --optimize --bin --abi SimpleToken.sol -o build
    ```

4. Deploy the contract to your chosen Ethereum network (testnet or local network):
    ```sh
    truffle migrate --network development
    ```

## Help

For common problems or issues, you can refer to the official Solidity documentation or seek help on forums like Stack Exchange or Ethereum Stack Exchange.

```sh
solidity-docs --help
```

## Authors

Shaurya Sharma  

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.