task("change-miner-owner-to-contract", "Change miner owner to contract address")
.addParam("contract", "The contract address")
.addParam("minerIdNumber", "The number of the miner ID (without f0/t0)")
.setAction(async (taskArgs) => {
    //store taskargs as useable variables
    const contractAddr = taskArgs.contract
    const id = taskArgs.minerIdNumber

    //create a new wallet instance
    const wallet = new ethers.Wallet(network.config.accounts[0], ethers.provider)

    //create a Counter contract factory
    const Counter = await ethers.getContractFactory("Counter", wallet)
    //create a Counter contract instance 
    //this is what you will call to interact with the deployed contract
    const counterContract = await Counter.attach(contractAddr)

    console.log("Changing miner owner address:")

    const transaction = await counterContract.changeMinerOwnerToContract(
      id,
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
