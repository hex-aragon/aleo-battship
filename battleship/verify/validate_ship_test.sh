#!/bin/bash

echo "carrier 항모 배의 배치, 배의 길이, 가로 비트열, 세로 비트열"
leo run validate_ship 34084860461056u64 5u64 31u64 4311810305u64

echo "battleship 전함 배의 배치, 배의 길이, 가로 비트열, 세로 비트열"
leo run validate_ship 551911718912u64 4u64 15u64 16843009u64

echo "cruiser 순양함 배의 배치, 배의 길이, 가로 비트열, 세로 비트열"
leo run validate_ship 7u64 3u64 7u64 65793u64

echo "destroyer 구축함의 배치, 배의 길이, 가로 비트열, 세로 비트열"
leo run validate_ship 1157425104234217472u64 2u64 3u64 257u64

