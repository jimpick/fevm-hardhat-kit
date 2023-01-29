task("echo-bytes", "Echos bytes")
.addParam("contract", "The contract address")
.addParam("bytes", "The bytes to send")
.setAction(async (taskArgs) => {
    //store taskargs as useable variables
    const contractAddr = taskArgs.contract
    const bytes = taskArgs.bytes

    //create a new wallet instance
    const wallet = new ethers.Wallet(network.config.accounts[0], ethers.provider)

    //create a SimpleCoin contract factory
    const Counter = await ethers.getContractFactory("Counter", wallet)
    //create a Counter contract instance 
    //this is what you will call to interact with the deployed contract
    const counterContract = await Counter.attach(contractAddr)

    console.log("Sending bytes:", bytes)

    //send transaction to call the sendCoin() method
    const transaction = await counterContract.echoBytes(bytes)
    console.log("Jim transaction", transaction)
    const receipt = await transaction.wait()
    console.log("Receipt", receipt)
    /*
    let result = BigInt(await simpleCoinContract.getBalance(toAccount)).toString()
    console.log("Total SimpleCoin at:", toAccount, "is", result)
    */
})