// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MiniNFT is ERC721, Ownable {

    uint256 private _nextTokenId; 

    //Imaginemos que cada Id representa a un cuadro de arte
    constructor() ERC721("Mi Galeria de arte", "GAL") Ownable(msg.sender) {

    }

    // ID(1) --> Monalisa
    // ID(2) --> La ultima cena
    // ID(3) --> El grito
    // ID(4) --> Las Meninas

    function crearCuadro(address _propietario) external onlyOwner {
        _safeMint(_propietario, ++_nextTokenId);
    }

}