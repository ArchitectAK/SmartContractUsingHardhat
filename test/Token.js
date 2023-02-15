const { expect } = require('chai')
const { ethers } = require('hardhat');

describe("TOken Contract",  () => {
  it("Deployment "), async () => {
    const [owner] = await ethers.getSigners();

    const Token = await ethers.getContractFactory("Token");
    
    const AKhardhatToken  = await Token.deploy();

    const ownerBalance = await AKhardhatToken.balanceOf(owner.address);
    expect(await AKhardhatToken.totalSupply()).to.equal(ownerBalance);
  }
})