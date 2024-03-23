#!/bin/bash

echo "
NETWORK=testnet3
PRIVATE_KEY=APrivateKey1zkpGKaJY47BXb6knSqmT3JZnBUEGBDFAWz2nMVSsjwYpJmm
" > .env


# 2: Player 1 Places Ships On The Board
echo "
###############################################################################
########                                                               ########
########           STEP 2: Player 1 Places Ships On The Board          ########
########                                                               ########
###############################################################################
"


leo run initialize_board 34084860461056u64 551911718912u64 7u64 1157425104234217472u64 aleo1wyvu96dvv0auq9e4qme54kjuhzglyfcf576h0g3nrrmrmr0505pqd6wnry || exit


echo "
✅ Successfully initialized Player 1's board."

echo "total ship 1157459741006397447u64"
echo "
00010000
00010000
00011111
10000000
10000000
10000000
10000000
00000111
"

echo "carrier position 34084860461056u64, length 5"
echo "
00000000
00000000
00011111
00000000
00000000
00000000
00000000
00000000
"

echo "battleship position 551911718912u64, length 4 "
echo "
00000000
00000000
00000000
10000000
10000000
10000000
10000000
00000000
"

echo "cruiser position 7u64, length 3 "
echo "
00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000111
"

echo "destroyer position 1157425104234217472u64, length 2"
echo "
00010000
00010000
00000000
00000000
00000000
00000000
00000000
00000000
"
