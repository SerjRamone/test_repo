#!/bin/bash 
  
for geth in $(find ~/.quai/ -name "geth.ipc" | sort);
do
        BALANCE=$(build/bin/quai attach $geth --exec "personal.listAccounts.forEach(function(account){console.log(account, web3.fromWei(eth.getBalance(account), 'ether'), 'Quai')})" | grep 0x);
        if [ "$BALANCE" != "" ]; then printf "$geth\n$BALANCE\n\n"; fi ;
done
