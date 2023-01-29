task("resolved-contract-address", "Get resolved contract address")
.addParam("contract", "The contract address")
.setAction(async (taskArgs) => {
    //store taskargs as useable variables
    const contractAddr = taskArgs.contract
    const bytes = taskArgs.bytes

    //create a new wallet instance
    const wallet = new ethers.Wallet(network.config.accounts[0], ethers.provider)

    //create a Counter contract factory
    const Counter = await ethers.getContractFactory("Counter", wallet)
    //create a Counter contract instance 
    //this is what you will call to interact with the deployed contract
    const counterContract = await Counter.attach(contractAddr)

    console.log("Getting resolved contract address:")

    //send transaction to call the sendCoin() method
    const transaction = await counterContract.getResolvedContractAddress(
      {
        gasLimit: 10000000
      }
    )
    /*
    const transaction = await counterContract.minerCount({
        gasLimit: 1000000
    })
    */
    console.log("Jim transaction", transaction)
    const receipt = await transaction.wait()
    console.log("Receipt", receipt)
    /*
    let result = BigInt(await simpleCoinContract.getBalance(toAccount)).toString()
    console.log("Total SimpleCoin at:", toAccount, "is", result)
    */
})
