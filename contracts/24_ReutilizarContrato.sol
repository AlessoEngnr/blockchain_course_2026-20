// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract CalculadoraNotas {

    string public formula = "(teoria * 20 + practica * 20 + laboratorio * 60) / 100";

    function calcularNotaFinal(uint256 teoria, uint256 practica, uint256 laboratorio) public pure returns (uint256) {
        return (teoria * 20 + practica * 20 + laboratorio * 60) / 100;
    }

    function devolverFormula() public view returns (string memory) {
        return formula;
    }
}

contract RegistrarNotas is Ownable {
    address public addressCalculadora;

    mapping(address => uint256) public notasAlumnos;

    constructor(address _addressCalculadora) Ownable(msg.sender) {
        addressCalculadora = _addressCalculadora;
    }

    function actualizarCalculadora(address _direccionCalculadora) public {
        addressCalculadora = _direccionCalculadora;
    }

    function registrarNotas(address _addressAlumno, uint256 _teoria, uint256 _practica, uint256 _laboratorio) public onlyOwner {
        CalculadoraNotas calculadora = CalculadoraNotas(addressCalculadora);
        uint256 notaFinal = calculadora.calcularNotaFinal(_teoria, _practica, _laboratorio);
        notasAlumnos[_addressAlumno] = notaFinal;
    }

    function verMiNota() public view returns (uint256) {
        return notasAlumnos[msg.sender];
    }

    function verFormula() public view returns (string memory) {
        CalculadoraNotas calculadora = CalculadoraNotas(addressCalculadora);
        return calculadora.devolverFormula();
    }
}