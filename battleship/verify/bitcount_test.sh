#!/bin/bash

echo "check carrier bit count1     >> 5u64" 
leo run bitcount_test 31u64

echo "check carrier bit count1     >> 5u64"
leo run bitcount_test 4311810305u64

echo "check battleship bit count2  >> 4u64"
leo run bitcount_test 15u64

echo "check battleship bit count2  >> 4u64"
leo run bitcount_test 16843009u64

echo "check cruiser bit count3 >> 3u64"
leo run bitcount_test 7u64

echo "check cruiser bit count3 >> 3u64"
leo run bitcount_test 65793u64

echo "check destroyer bit count4 >> 3u64"
leo run bitcount_test 3u64

echo "check destroyer bit count4 >> 3u64"
leo run bitcount_test 257u64