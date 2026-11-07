// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Teleton {

    mapping(address => bool) public administradores;
    address public owner;


    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner, "No eres el owner del contrato");
        _;
    }

    modifier isAdministrador() {
        require(administradores[msg.sender] == true, "No eres parte de los administradores");
        _;
    }

    function agregarAdministrador(address _cuenta) public isOwner {
        administradores[_cuenta] = true;
    }

    function consultarBalance() public view isAdministrador returns (uint256) {
        return address(this).balance;
    }

    function depositar() public payable {

    }

    function retirar() public isOwner {
        payable(owner).transfer(address(this).balance);
    }

}