//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numberAddressWhitelisted;

    constructor(uint8 _maxWhitelistedAddress) {
        maxWhitelistedAddresses = _maxWhitelistedAddress;
    }

    function addAddressToWhilelist() public {
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );
        require(
            numberAddressWhitelisted < maxWhitelistedAddresses,
            "More address cant be added, limit reached"
        );
        whitelistedAddresses[msg.sender] = true;
        numberAddressWhitelisted += 1;
    }
}
