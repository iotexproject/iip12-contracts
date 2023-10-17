# iip12-contracts
Contract Interface, ABI and examples for the IIP12 implementation.

[Go to the ABI →](https://github.com/simonerom/iip12-contracts/blob/learn/abi/NativeStaking.abi)

[Explore the contract interface →](https://github.com/simonerom/iip12-contracts/blob/learn/interface/NativeStaking.sol)

The virtual contract is assiciated with the address `0x04c22afae6a03438b8fed74cb1cf441168df3f12` on both IoTeX Mainnet and Testnet.

It's important to note that this isn't a conventional smart contract that is deployed and resides on the blockchain with a specific contract address. Rather, it's a pre-defined address recognized solely by the blockchain protocol, which processes incoming transactions in a unique manner. Its sole purpose is to facilitate access to the IoTeX protocol's staking actions for an Ethereum client. As a result, while you can send execution or read transactions to this address using the Ethereum JSON RPC API, **you cannot call the same functions from another smart contract**. This is because the virtual contract isn't visible to the EVM.

[Go to the IIP12 Full Proposal →](https://github.com/iotexproject/iips/blob/master/iip-12.md)

