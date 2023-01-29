const { ethers } = require("hardhat")

const networkConfig = {
    3141: {
        name: "hyperspace",
        tokensToBeMinted: 12000,
    },
    31415926: {
        name: "localnetfarm",
        tokensToBeMinted: 12000,
    }
}

// const developmentChains = ["hardhat", "localhost"]

module.exports = {
    networkConfig,
    // developmentChains,
}
