// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MiTokenERC20 is ERC20 {
    constructor() ERC20("Ballenita Fan Token", "BFT") {
        _mint(msg.sender, 10000000 * 10 ** decimals()); // forma correcta
    }

    function totalSupplyBFC() public view returns (uint256) {
        return totalSupply() / (10 ** decimals());
    }

    function balanceOfBFC(address _address) public view returns (uint256) {
        return balanceOf(_address) / (10 ** decimals());
    }
}