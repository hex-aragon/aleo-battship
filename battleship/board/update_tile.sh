#!/bin/bash

  echo "
  NETWORK=testnet3
  PRIVATE_KEY=APrivateKey1zkp86FNGdKxjgAdgQZ967bqBanjuHkAaoRe19RK24ZCGsHH
  " > .env


leo run update_played_tiles '{
    owner: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
    hits_and_misses: 0u64.private,
    played_tiles: 2048u64.private,
    ships: 9044591273705727u64.private,
    player_1: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
    player_2: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
    game_started: true.private,
    _nonce: 5254963165391133332409074172682159033621708071536429341861038147524454777097group.public
  }' 4u64 