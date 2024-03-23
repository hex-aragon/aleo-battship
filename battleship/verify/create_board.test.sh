#!/bin/bash

echo "create_board_test carrier, battleship, cruiser, destroyer"
echo "배치된 배를 전체 보드에 비트별로 결합한다"
echo "expect 1157459741006397447u64"
leo run create_board_test 34084860461056u64 551911718912u64 7u64 1157425104234217472u64

