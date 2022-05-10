//SPDX-License-Identifier: Unlicense
pragma solidity >=0.5.0 <0.9.0;

contract ZombieFactory {
    uint256 dnaDigits = 16;
    uint256 dnaModulus = 10**dnaDigits;

    struct Zombie {
        string name;
        uint256 dna;
    }

    Zombie[] public zombies;

    /**
     * @dev Creates a new zombie with the given name and dna.
     * @param _name The name of the zombie.
     * @param _dna The DNA of the zombie.
     */
    function _createZombie(string memory _name, uint256 _dna) private {
        zombies.push(Zombie(_name, _dna));
    }

    function _generateRandomDna(string memory _str)
        private
        view
        returns (uint256)
    {}
}
