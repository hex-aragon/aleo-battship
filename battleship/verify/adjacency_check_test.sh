#!/bin/bash

echo "인접성 검사, 배의 위치, 가로"
echo "is_adjacent : bool  = adjacency_check(ship, horizontal)"
leo run adjacency_check_test 34084860461056u64 31u64

echo "인접성 검사, 배의 위치, 세로"
echo "is_adjacent : bool  = adjacency_check(ship, vertical)"
leo run adjacency_check_test 34084860461056u64 4311810305u64
