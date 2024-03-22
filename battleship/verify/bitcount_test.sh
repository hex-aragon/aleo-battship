#!/bin/bash

echo "check carrier bit count1 horizontal >> 5u64" 
leo run bitcount_test 31u64

echo "check carrier bit count1 vertical   >> 5u64"
leo run bitcount_test 4311810305u64

echo "check battleship bit count2 horizontal >> 4u64"
leo run bitcount_test 15u64

echo "check battleship bit count2 vertical >> 4u64"
leo run bitcount_test 16843009u64

echo "check cruiser bit count3 horizontal >> 3u64"
leo run bitcount_test 7u64

echo "check cruiser bit count3 vertical>> 3u64"
leo run bitcount_test 65793u64

echo "check destroyer bit count4 horizontal >> 2u64"
leo run bitcount_test 3u64

echo "check destroyer bit count4 vertical >> 2u64"
leo run bitcount_test 257u64