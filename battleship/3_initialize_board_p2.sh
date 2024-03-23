# 4: Player 2 Places Ships On The Board
echo "
###############################################################################
########                                                               ########
########           STEP 4: Player 2 Places Ships On The Board          ########
########                                                               ########
###############################################################################
"
(
  echo "
  NETWORK=testnet3
  PRIVATE_KEY=APrivateKey1zkp86FNGdKxjgAdgQZ967bqBanjuHkAaoRe19RK24ZCGsHH
  " > .env

  leo run initialize_board 31u64 2207646875648u64 224u64 9042383626829824u64 aleo15g9c69urtdhvfml0vjl8px07txmxsy454urhgzk57szmcuttpqgq5cvcdy || exit
)
echo "
✅ Successfully initialized Player 2's board."


echo "total ship 9044591273705727u64"
echo "
00000000
00100000
00100010
00000010
00000010
00000010
00000000
11111111
"

echo "carrier position 31u64, length 5"
echo "
00000000
00000000
00000000
00000000
00000000
00000000
00000000
00011111
"

echo "battleship position 2207646875648u64, length 4"
echo "
00000000
00000000
00000010
00000010
00000010
00000010
00000000
00000000
"


echo "cruiser position 224u64, length 3"
echo "
00000000
00000000
00000000
00000000
00000000
00000000
00000000
11100000
"


echo "destroyer position 9042383626829824u64, length 2"
echo "
00000000
00100000
00100000
00000000
00000000
00000000
00000000
00000000
"
