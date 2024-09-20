const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("String", function () {
  let stringContract;

  beforeEach(async function () {
    const String = await ethers.getContractFactory("String");
    stringContract = await String.deploy();
    await stringContract.waitForDeployment();
  });

  it("should return 0x6300 for charAt('abcdef', 2)", async function () {
    const result = await stringContract.charAt("abcdef", 2);
    expect(result).to.equal("0x6300");
  });

  it("should return 0x0000 for charAt('', 0)", async function () {
    const result = await stringContract.charAt("", 0);
    expect(result).to.equal("0x0000");
  });

  it("should return 0x0000 for charAt('george', 10)", async function () {
    const result = await stringContract.charAt("george", 10);
    expect(result).to.equal("0x0000");
  });
});
