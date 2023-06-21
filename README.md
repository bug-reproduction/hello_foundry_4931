# Setup

make sure you have a fresh anvil started

```bash
anvil
```


# Demo

## Execute the first time

```bash
forge script --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80  --rpc-url http://localhost:8545 --broadcast script/Counter.s.sol
```

This produce the following log:

Interestingly the create2 factory is actually deployed (see next execution), it give a code.length of zero

And then the next issue is that the valid call to create2 fails giving 0x0000...

```
== Logs ==
  create2 factory is not deployed
  sending fund to create2 fatory deployer...
  10000000000000000
  deploying create2 factory....
  create2 factory is now deployed
  0
  deploying contract...
  contract is now deployed
  0x0000000000000000000000000000000000000000
```

## The second execution


We run the exact same script
```bash
forge script --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80  --rpc-url http://localhost:8545 --broadcast script/Counter.s.sol
```

But now the contract get deployed succesffuly 

```
== Logs ==
  create2 factory already deployed
  deploying contract...
  contract is now deployed
  0x654e11378BA43305Dad2D63401725497d82172Ac
```


# Conclusion

the sendRawTransaction does not seem to effect the current execution and 2 run neeed to be run to have the desired effect