task("increment", "Increments counts")
.addParam("contract", "The contract address")
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

    let before = await counterContract.number()
    console.log("Counter before:", before.toString())

    console.log("Increment...")

    //send transaction to call the sendCoin() method
    const transaction = await counterContract.increment()
    console.log("Transaction", transaction)
    const receipt = await transaction.wait()
    console.log("Receipt", receipt)

    let after = await counterContract.number()
    console.log("Counter after:", after.toString())
})