const { expect } = require("chai");
const { ethers } = require("hardhat");
require("chai").should();

describe("ZombieFeeding smart contract", () => {
  beforeEach(async () => {
    ZombieFeeding = await ethers.getContractFactory("ZombieFeeding");
    [owner, user] = await ethers.getSigners();
    zombieFeeding = await ZombieFeeding.deploy();
  });

  it("", async () => {});
});
