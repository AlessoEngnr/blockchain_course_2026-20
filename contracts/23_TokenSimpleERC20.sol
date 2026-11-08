// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BFTSimple is ERC20 {
    constructor() ERC20("Ballenita Fan Token", "BFT") {

    }
}