// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract BibliotecaID000242578 {

    // b) Estructura con 4 atributos (id obligatorio)
    struct Libro {
        uint256 id;
        string titulo;
        string autor;
        uint256 anio;
    }

    // c) Arreglo público del tipo de la estructura
    Libro[] public libros;

    // d) Variables de estado públicas
    uint256 public posicion;
    address public direccion;

    // Constructor
    constructor(uint256 _posicion) {
        posicion = _posicion;
        direccion = msg.sender;
    }

    // PARTE 3
    function agregarElemento(uint256 _id, string memory _titulo, string memory _autor, uint256 _anio) public {
        libros.push(Libro(_id, _titulo, _autor, _anio));
    }

    function contarElementos() public view returns (uint256) {
        return libros.length;
    }

    function cambiarDireccion(address _nuevaDireccion) public {
        direccion = _nuevaDireccion;
    }

}