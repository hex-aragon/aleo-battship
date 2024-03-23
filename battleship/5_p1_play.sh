 echo "
  NETWORK=testnet3
  PRIVATE_KEY=APrivateKey1zkpGKaJY47BXb6knSqmT3JZnBUEGBDFAWz2nMVSsjwYpJmm
  " > .env

  leo run play '{
    owner: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
    hits_and_misses: 0u64.private,
    played_tiles: 0u64.private,
    ships: 1157459741006397447u64.private,
    player_1: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
    player_2: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
    game_started: true.private,
    _nonce: 6563064852163330630334088854834332804417910882908622526775624018226782316843group.public
  }' '{
    owner: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
    incoming_fire_coordinate: 0u64.private,
    player_1: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
    player_2: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
    prev_hit_or_miss: 0u64.private,
    _nonce: 3742551407126138397717446975757978589064777004441277005584760115236217735495group.public
  }' 1u64 || exit