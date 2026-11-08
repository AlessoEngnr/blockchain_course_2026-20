// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CalcularNotas {
    
    function calcularNotaFinal(uint256 teoria, uint256 practica, uint256 laboratorio) public pure returns(uint256) {
        return (teoria * 25 + practica * 25 + laboratorio * 50) / 100;
    }
    
}

contract RegitrarNotas is Ownable {
    address public addressCalculadora;

    mapping(address => uint256) public notasAlumnos; 

    constructor(address _addressCalculadora) Ownable(msg.sender) {
        addressCalculadora = _addressCalculadora;
    }

    function actulizarCalculadora(address _direccionCalculdora) public {
        addressCalculadora = _direccionCalculdora;
    }

    function registrarNotas(address _addressAlumno, uint256 _teoria, uint256 _practica, uint256 _laboratorio) onlyOwner public {
        CalcularNotas calculadora = CalcularNotas(addressCalculadora);
        uint256 notaFinal = calculadora.calcularNotaFinal(_teoria, _practica, _laboratorio);
        notasAlumnos[_addressAlumno] = notaFinal;
    }

    function verMiNota() public view returns (uint256) {
        return notasAlumnos[msg.sender];
    }

}