// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Animal {

    string public especie;

    constructor(string memory _especie) { especie = _especie; }

    function obtenerInfo() public view returns (string memory) {
        return string.concat("La especie es: ", especie);
    }

    function hacerSonido() public pure virtual returns (string memory) {
        return "???";
    }

}

contract Perro is Animal {
    constructor() Animal("Canis familiaris") {}

    function hacerSonido() public pure override returns (string memory) {
        return "Guauf!!";
    }
}

contract Gato is Animal {
    constructor() Animal("Felis catus") {}

        function hacerSonido() public pure override returns (string memory) {
        return "Miaou!!";
    }
}