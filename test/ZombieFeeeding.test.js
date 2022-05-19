const { expect } = require("chai");
const { ethers } = require("hardhat");
require("chai").should();

describe("ZombieFeeding smart contract", () => {
  beforeEach(async () => {
    ZombieFeeding = await ethers.getContractFactory("ZombieFeeding");
    [owner, user] = await ethers.getSigners();
    zombieFeeding = await ZombieFeeding.deploy();
  });

  it("Only the owner should be able to set the CryptoKitties smart contract", async () => {
    await zombieFeeding
      .connect(owner)
      .setKittyContractAddress("0x0000000000000000000000000000000000000000");

    await zombieFeeding
      .connect(user)
      .setKittyContractAddress("0x0000000000000000000000000000000000000000")
      .should.be.revertedWith("Ownable: caller is not the owner");
  });
});
