async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with account:", deployer.address);
  
    const ProductStorage = await ethers.getContractFactory("ProductStorage");
    const productstorage = await ProductStorage.deploy();
  
    console.log("ProductStorage address:", await productstorage.getAddress());
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });