const Web3 = require('web3');
const web3 = new Web3('http://192.168.1.72:6789'); // 连接本地节点

const abi = [ /* 你的合约 ABI */ ];
const bytecode = '0x...'; // 你的合约字节码

const deployContract = async () => {
  const accounts = await web3.eth.getAccounts();
  const deployAccount = accounts[0]; // 使用第一个账户

  const contract = new web3.eth.Contract(abi);

  try {
    const deployTx = contract.deploy({
      data: bytecode,
      arguments: [], // 构造函数参数示例
    });

    const gas = await deployTx.estimateGas();
    const gasPrice = await web3.eth.getGasPrice();

    const receipt = await deployTx.send({
      from: deployAccount,
      gas,
      gasPrice,
    });

    console.log('合约部署成功！地址:', receipt.options.address);
  } catch (error) {
    console.error('部署失败:', error);
  }
};

deployContract();