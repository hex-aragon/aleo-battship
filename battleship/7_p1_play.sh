_echo "
###############################################################################
########                                                               ########
########              STEP 8: Player 1 Takes The 3rd Turn              ########
########                                                               ########
###############################################################################
"
(
  echo "
  NETWORK=testnet3
  PRIVATE_KEY=APrivateKey1zkpGKaJY47BXb6knSqmT3JZnBUEGBDFAWz2nMVSsjwYpJmm
  " > .env

  leo run play '{
    owner: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
    hits_and_misses: 0u64.private,
    played_tiles: 1u64.private,
    ships: 1157459741006397447u64.private,
    player_1: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
    player_2: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
    game_started: true.private,
    _nonce: 1474170213684980843727833284550698461565286563122422722760769547002894080093group.public
  }' '{
    owner: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
    incoming_fire_coordinate: 2048u64.private,
    player_1: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
    player_2: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
    prev_hit_or_miss: 1u64.private,
    _nonce: 5851606198769770675504009323414373017067582072428989801313256693053765675198group.public
  }' 2u64 || exit
)
echo "
✅ Successfully executed Player 1's turn."