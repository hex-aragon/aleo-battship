echo "
###############################################################################
########                                                               ########
########               STEP 7: Player 2 Takes The 2nd Turn             ########
########                                                               ########
###############################################################################
"
(

  echo "
  NETWORK=testnet3
  PRIVATE_KEY=APrivateKey1zkp86FNGdKxjgAdgQZ967bqBanjuHkAaoRe19RK24ZCGsHH
  " > .env

  leo run play '{
    owner: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
    hits_and_misses: 0u64.private,
    played_tiles: 0u64.private,
    ships: 9044591273705727u64.private,
    player_1: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
    player_2: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
    game_started: true.private,
    _nonce: 6222383571142756260765569201308836492199048237638652378826141459336360362251group.public
  }' '{
    owner: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
    incoming_fire_coordinate: 1u64.private,
    player_1: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
    player_2: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
    prev_hit_or_miss: 0u64.private,
    _nonce: 5481529266389297320813092061136936339861329677911328036818179854958874588416group.public
  }' 2048u64 || exit
)
echo "
✅ Successfully executed Player 2's turn."