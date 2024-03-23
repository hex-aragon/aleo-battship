# 5: Passing The Board Back To Player 1
echo "
###############################################################################
########                                                               ########
########          STEP 5: Passing The Board Back To Player 1           ########
########                                                               ########
###############################################################################

"
leo run start_battleship '{
  owner: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
  hits_and_misses: 0u64.private,
  played_tiles: 0u64.private,
  ships: 9044591273705727u64.private,
  player_1: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
  player_2: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
  game_started: false.private,
  _nonce: 1549419609469324182591325047490602235361156298832591378925133482196483208807group.public
}' '{
  owner: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
  incoming_fire_coordinate: 0u64.private,
  player_1: aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy.private,
  player_2: aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry.private,
  prev_hit_or_miss: 0u64.private,
  _nonce: 4374626042494973146987320062571809401151262172766172816829659487584978644457group.public
}' || exit
echo "
✅ Successfully passed the board back to Player 1."