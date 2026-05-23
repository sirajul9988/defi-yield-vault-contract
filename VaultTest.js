const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("YieldVault", function () {
  it("Should allow users to deposit and receive shares", async function () {
    const [owner, user] = await ethers.getSigners();

    // Deploy a Mock Token
    const Token = await ethers.getContractFactory("ERC20Mock");
    const token = await Token.deploy("Mock", "MCK", owner.address, ethers.parseEther("1000"));
    await token.waitForDeployment();

    // Deploy the Vault
    const Vault = await ethers.getContractFactory("YieldVault");
    const vault = await Vault.deploy(await token.getAddress(), "Vault Token", "vTK");
    await vault.waitForDeployment();

    // Approve and Deposit
    const amount = ethers.parseEther("100");
    await token.transfer(user.address, amount);
    await token.connect(user).approve(await vault.getAddress(), amount);
    await vault.connect(user).deposit(amount, user.address);

    expect(await vault.balanceOf(user.address)).to.equal(amount);
    console.log("Successfully deposited 100 tokens and received 100 shares");
  });
});
