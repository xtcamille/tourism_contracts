// async function main() {
//     const [deployer] = await ethers.getSigners();
//     console.log("Deploying contracts with account:", deployer.address);
  
//     const ProductStorage = await ethers.getContractFactory("ProductStorage");
//     const productstorage = await ProductStorage.deploy();
  
//     console.log("ProductStorage address:", await productstorage.getAddress());
    
//     const TicketStorage = await ethers.getContractFactory("TicketStorage");
//     const ticketStorage = await TicketStorage.deploy();
  
//     console.log("TicketStorage address:", await ticketStorage.getAddress());
  

//   }


// const hre = require("hardhat");
//   async function main() {
//     const [deployer] = await hre.ethers.getSigners();
//     console.log("Deploying contracts with account:", deployer.address);
  
//     const ProductReview = await ethers.getContractFactory("ProductReview");
//     const productReview = await ProductReview.deploy("0x5FbDB2315678afecb367f032d93F642f64180aa3");
  
//     // console.log("ProductReview address:", await productReview.getAddress());
//     console.log("ProductReview address:", "0xd9145CCE52D386f254917e481eB44e9943F39138");
//     const ScenicReview = await ethers.getContractFactory("ScenicReview");
//     const scenicReview = await ScenicReview.deploy("0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512");
  
//     // console.log("ScenicReview address:", await scenicReview.getAddress());
      
//     console.log("ScenicReview address:", "0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8");

//   }


  // const hre = require("hardhat");
  // async function main() {
  //   const [deployer] = await hre.ethers.getSigners();
  //   console.log("Deploying contracts with account:", deployer.address);
  
  //   const ProductOracle = await ethers.getContractFactory("ProductOracle");
  //   const productOracle = await ProductOracle.deploy();
  //   // console.log("ProductReview address:", await productOracle.getAddress());
  //   console.log("ProductOracle address:", "0xf8e81D47203A594245E36C48e151709F0C19fBe8");
    
  //   const ScenicOracle = await hre.ethers.getContractFactory("ScenicOracle");
  //   const scenicOracle = await ScenicOracle.deploy();
  //   console.log("ScenicOracle address:", "0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B");
  //   // console.log("ScenicReview address:", await scenicOracle.getAddress());
  // }

  const hre = require("hardhat");
  async function main() {
    const [deployer] = await hre.ethers.getSigners();
    console.log("Deploying contracts with account:", deployer.address);
  
    const ProductRegulation = await ethers.getContractFactory("ProductRegulation");
    const productRegulation = await ProductRegulation.deploy("0xd9145CCE52D386f254917e481eB44e9943F39138","0xf8e81D47203A594245E36C48e151709F0C19fBe8");
    // console.log("ProductRegulation address:", await productRegulation.getAddress());
    console.log("ProductRegulation address:", "0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47");
    
    
    const ScenicRegulation = await hre.ethers.getContractFactory("ScenicRegulation");
    const scenicRegulation = await ScenicRegulation.deploy("0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8","0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B");
    // console.log("ScenicRegulation address:", await scenicRegulation.getAddress());
    console.log("ScenicRegulation address:", "0xDA0bab807633f07f013f94DD0E6A4F96F8742B53");
  }

  
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });