#!/bin/bash

echo "
NETWORK=testnet3
PRIVATE_KEY=APrivateKey1zkpGKaJY47BXb6knSqmT3JZnBUEGBDFAWz2nMVSsjwYpJmm
" > .env

echo "game_started : true"

leo run start_board_test "{
  owner: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
  hits_and_misses: 0u64.private,
  played_tiles: 0u64.private,
  ships: 1157459741006397447u64.private,
  player_1: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
  player_2: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
  game_started: false.private,
  _nonce: 5779509360921149777163262542500932903323954599431336960376523690287760574466group.public
}"