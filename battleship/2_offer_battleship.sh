#!/bin/bash

# 3: Player 1 Passes The Board To Player 2
echo "
###############################################################################
########                                                               ########
########         STEP 3: Player 1 Passes The Board To Player 2         ########
########                                                               ########
###############################################################################
"
leo run offer_battleship '{
  owner: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
  hits_and_misses: 0u64.private,
  played_tiles: 0u64.private,
  ships: 1157459741006397447u64.private,
  player_1: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
  player_2: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
  game_started: false.private,
  _nonce: 3887646704618532506963887075433683846689834495661101507703164090915348189037group.public
}' || exit
echo "
✅ Successfully passed the board to Player 2."