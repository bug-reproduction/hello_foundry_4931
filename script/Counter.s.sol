// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        if (address(0x4e59b44847b379578588920cA78FbF26c0B4956C).code.length == 0) {
            console.log("create2 factory is not deployed");
            if (address(0x3fAB184622Dc19b6109349B94811493BF2a45362).balance < 10000000 gwei) {
                console.log("sending fund to create2 fatory deployer...");
                vm.broadcast();
                payable(0x3fAB184622Dc19b6109349B94811493BF2a45362).transfer(10000000 gwei);
                console.log(address(0x3fAB184622Dc19b6109349B94811493BF2a45362).balance);
            }
            
            console.log("deploying create2 factory....");
            vm.broadcast();
            vm.sendRawTransaction(
                hex"f8a58085174876e800830186a08080b853604580600e600039806000f350fe7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe03601600081602082378035828234f58015156039578182fd5b8082525050506014600cf31ba02222222222222222222222222222222222222222222222222222222222222222a02222222222222222222222222222222222222222222222222222222222222222"
            );
            console.log("create2 factory is now deployed");
            console.log(address(0x4e59b44847b379578588920cA78FbF26c0B4956C).code.length);
        } else {
            console.log("create2 factory already deployed");
        }

        bytes32 salt = bytes32(0);
        address deployed;
        bytes memory data = hex"608060405234801561001057600080fd5b5060f78061001f6000396000f3fe6080604052348015600f57600080fd5b5060043610603c5760003560e01c80633fb5c1cb1460415780638381f58a146053578063d09de08a14606d575b600080fd5b6051604c3660046083565b600055565b005b605b60005481565b60405190815260200160405180910390f35b6051600080549080607c83609b565b9190505550565b600060208284031215609457600080fd5b5035919050565b60006001820160ba57634e487b7160e01b600052601160045260246000fd5b506001019056fea2646970667358221220fae0b1cefc14f831678071dac56d7c756dba4a7e705742be3f473c8c85e2769564736f6c63430008140033";
        
        console.log("deploying contract...");
        vm.broadcast();
        assembly {
            deployed := create2(0, add(data, 0x20), mload(data), salt)
        }
        console.log("contract is now deployed");
        console.log(deployed);
    }
}
