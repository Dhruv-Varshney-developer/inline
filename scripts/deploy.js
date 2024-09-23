// scripts/deploy.js

const { ethers } = require("hardhat");

async function main() {
  // Deploy BitWise contract
  const BitWise = await ethers.getContractFactory("BitWise");
  const bitWise = await BitWise.deploy();
  await bitWise.waitForDeployment();
  console.log("BitWise deployed to:", bitWise.address);

  // Deploy String contract
  const StringContract = await ethers.getContractFactory("String");
  const stringContract = await StringContract.deploy();
  await stringContract.waitForDeployment();
  console.log("String deployed to:", stringContract.address);
}

// Execute the deployment script
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
