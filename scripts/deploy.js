const main = async () => {
  const [deployer] = await hre.ethers.getSigners()
  console.log('Contract deployed by:', deployer.address);

  const accountBalance = await deployer.getBalance();
  console.log('Account Balance:', accountBalance.toString());
  
  const Token = await hre.ethers.getContractFactory('WavePortal');
  const portal = await Token.deploy();
  
  console.log('Contract deployed to:', portal.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0); // exit Node process without error
  } catch (error) {
    console.log(error);
    process.exit(1); // exit Node process while indicating 'Uncaught Fatal Exception' error
  }
  // Read more about Node exit ('process.exit(num)') status codes here: https://stackoverflow.com/a/47163396/7974948
};

runMain();
