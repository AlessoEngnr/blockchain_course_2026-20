// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MiTokenERC20 is ERC20 {

    address public owner;

    constructor() ERC20("Ballenita Fan Token", "BFT") {
        owner = msg.sender;
        _mint(owner, 1000 * 10 ** decimals()); // forma correcta
    }

    modifier isOwner() {
        require(msg.sender == owner, "No eres el owner del contrato");
        _;
    }

    function totalSupplyBFT() public view returns(uint256) {
        return totalSupply() / (10 ** decimals());
    }

    function balanceOfBFT(address _address) public view returns(uint256) {
        return balanceOf(_address) / (10 ** decimals());
    }

    function mintear(address _to, uint256 _cantidad) public isOwner {
        _mint(_to, _cantidad);
    }

    function mintearBFT(address _to, uint256 _cantidad) public isOwner {
        _mint(_to, _cantidad * 10 ** decimals());
    }

    function esSocio(address _cuenta) external view returns(bool) {
        return balanceOf(_cuenta) > 0;
    }
}