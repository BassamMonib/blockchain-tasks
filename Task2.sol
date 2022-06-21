// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Task2 is ERC20, Ownable {

    /**
     * @dev Initializing ERC20 constructor with given `name` and `symbol`
     *
     * See {ERC20-constructor}.
     */
    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        // Minting some initial tokens
        _mint(msg.sender, initialSupply);
    }

    /**
     * @dev Tokens are sent to other account addresses using `transfer` / `transferFrom`
     * So overriding both functions as per the requirements
     */

    function transfer(address to, uint256 amount) override public returns (bool) {
         // burning 20% amount
        _burn(msg.sender, (amount * 20) / 100);

         // sending 30% amount to contract owner address
        super.transfer(owner(), (amount * 30) / 100);

        // sending 50% amount to 0x9A020cFcA5F5CFcE8FE48E92c55eB14C07A6495d
        super.transfer(0x9A020cFcA5F5CFcE8FE48E92c55eB14C07A6495d, (amount * 50) / 100);

        return true;
    }

    function transferFrom(address from, address to, uint256 amount) override public returns (bool) {
        // burning 20% amount
        _burn(from, (amount * 20) / 100);

        // sending 30% amount to contract owner address
        super.transferFrom(from, owner(), (amount * 30) / 100);

        // sending 50% amount to 0x9A020cFcA5F5CFcE8FE48E92c55eB14C07A6495d
        super.transferFrom(from, 0x9A020cFcA5F5CFcE8FE48E92c55eB14C07A6495d, (amount * 50) / 100);

        return true;
    }
}
