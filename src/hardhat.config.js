require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
  networks: {
    localhost: {
      url: "http://localhost:8545",
    },
    // sepolia: {
    //   url: "https://sepolia.infura.io/v3/YOUR_API_KEY",
    //   accounts: ["0xPRIVATE_KEY"] // 替换为你的私钥
    // }
  },
};
