// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BallenitaFCToken is ERC20, Ownable {

    uint public precioToken = 0.001 ether;

    constructor() ERC20("Ballenita Fan Token", "BFT") Ownable(msg.sender) {
        _mint(owner(), 1000 * 10 ** decimals());
    }

    function totalSupplyBFT() public view returns (uint256) {
        return totalSupply() / (10 ** decimals());
    }

    function balanceOfBFT(address _address) public view returns (uint256) {
        return balanceOf(_address) / (10 ** decimals());
    }

    function mintear(address _to, uint256 _cantidad) public onlyOwner {
        _mint(_to, _cantidad);
    }

    function mintearBFT(address _to, uint256 _cantidad) public onlyOwner {
        _mint(_to, _cantidad * 10 ** decimals());
    }

    function esSocio(address _cuenta) external view returns (bool) {
        return balanceOf(_cuenta) > 0;
    }

    function comprarToken() public payable {
        require(msg.value >= precioToken, "Debes enviar una cantidad mayor al precio del Token (0.001 Ether).");
        uint cantidadBFT = msg.value / precioToken;
        _mint(msg.sender, cantidadBFT * 10 ** decimals());
    }

    function retirar() public onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

}