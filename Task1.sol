// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

/**
 * @dev Grants the account `ownership` that deploys the contract
 *.due to ownable contract
 *
 * See {Ownable-constructor}
 */
contract Task1 is Ownable {
    /**
     * @dev Contract receives the `amount` from user using fallback function
     * Then transfer the amount to the owner of contract
     */
    receive() external payable {
        payable(owner()).transfer(msg.value);
    }
}
