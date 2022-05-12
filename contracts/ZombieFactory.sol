//SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract ZombieFactory is Ownable {
    event NewZombie(uint256 zombieId, string name, uint256 dna);

    uint256 private dnaDigits = 16;
    uint256 internal dnaModulus = 10 ** dnaDigits;
    uint256 public cooldownTime = 1 days;

    struct Zombie {
        string name;
        uint256 dna;
        uint32 level;
        uint32 readyTime;
    }

    Zombie[] public zombies;

    mapping(uint256 => address) public zombieToOwner;
    mapping(address => uint256) public ownerZombieCount;

    /**
     * @dev Creates a new zombie with the given name and dna.
     * @param _name The name of the zombie.
     * @param _dna The DNA of the zombie.
     */
    function _createZombie(string memory _name, uint256 _dna) internal {
        zombies.push(Zombie(_name, _dna, 1, uint32(block.timestamp + cooldownTime)));
        uint256 id = zombies.length - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);
    }
    
    function _generateRandomDna(string memory _str)
        private
        view
        returns (uint256)
    {
        uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        uint256 randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

    function getZombies() public view returns (Zombie[] memory) {
        return zombies;
    }
}
