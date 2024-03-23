program board.aleo {
    // 전투함 보드는 8x8 크기의 정사각형으로 나타낼 수 있다.
    // 한 개의 u64가 단일 보드에서의 명중 또는 실패를 나타내는 데에 충분하다.
    // 맨 위 행부터 왼쪽에서 오른쪽으로, 명중은 1이고 실패는 0이다.
    // 첫 번째 움직임에서 1행 3열에 명중한 경우:
    // 00100000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
    // 두 번째 u64는 어떤 사각형이 플레이되었는지를 나타내며, 1은 플레이된 사각형이고 
    // 0은 플레이되지 않은 사각형이다.
    record board_state {
        owner: address,
        // 상대방 보드에서 등록된 명중과 실패.
        hits_and_misses: u64,
        // 상대방 보드에서 플레이된 사각형.
        played_tiles: u64,
        // 자신의 보드의 모든 선박 위치를 나타내는 선박 비트열.
        ships: u64,
        player_1: address,
        player_2: address,
        game_started: bool,
    }

    // 새로운 board_state를 반환한다.
    transition new_board_state(
        ships: u64,
        opponent: address,
    ) -> board_state {
        return board_state {
            owner: self.caller,
            hits_and_misses: 0u64,
            played_tiles: 0u64,
            ships,
            player_1: self.caller,
            player_2: opponent,
            game_started: false,
        };
    }

    // 시작된 board_state가 된 새로운 board_state를 반환한다.
    // 이 보드가 이전에 게임을 시작한 적이 있는지 확인한다.
    transition start_board(
        // 시작할 보드의 레코드. 보드는 한 번만 시작될 수 있다.
        board: board_state,
    ) -> board_state {
        // 이 보드가 이전에 게임을 시작한 적이 없는지 확인한다.
        assert(!board.game_started);

        return board_state {
            owner: board.owner,
            hits_and_misses: board.hits_and_misses,
            played_tiles: board.played_tiles,
            ships: board.ships,
            player_1: board.player_1,
            player_2: board.player_2,
            game_started: true,
        };
    }

    transition start_board_test(
        // 시작할 보드의 레코드. 보드는 한 번만 시작될 수 있다.
        board: board_state,
    ) -> board_state {
        // 이 보드가 이전에 게임을 시작한 적이 없는지 확인한다.
        assert(!board.game_started);

        return board_state {
            owner: board.owner,
            hits_and_misses: board.hits_and_misses,
            played_tiles: board.played_tiles,
            ships: board.ships,
            player_1: board.player_1,
            player_2: board.player_2,
            game_started: true,
        };
    }

    // 특정 슛으로 업데이트된 플레이된 사각형을 포함한 새로운 board_state 레코드를 반환한다.
    // 슛이 이전에 발사된 경우 실패한다.
    transition update_played_tiles(
        // 업데이트할 보드 레코드.
        board: board_state,
        // 상대방에게 전송할 비트열 화재 좌표에 해당하는 u64.
        shoot: u64,
    ) -> board_state {
        // 슛이 유효한 움직임인지 확인해야 합니다. 슛 중 하나의 비트만 플립되어야 한다.
        let flip_bit: u64 = shoot - 1u64;
        // 비트 당 AND 연산
        let check_move: u64 = shoot & flip_bit;
        assert_eq(check_move, 0u64);

        // 슛이 플레이된 타일: 겹치는 비트 없어야 한다.
        let check_tiles: u64 = shoot & board.played_tiles;
        assert_eq(check_tiles, 0u64);

        // 플레이된 타일을 업데이트한다.
        let played_tiles: u64 = board.played_tiles | shoot;

        return board_state {
            owner: board.owner,
            hits_and_misses: board.hits_and_misses,
            played_tiles,
            ships: board.ships,
            player_1: board.player_1,
            player_2: board.player_2,
            game_started: board.game_started,
        };
    }

    // 특정 샷의 명중 또는 실패에 대한 정보로 업데이트된 명중 및 실패를 포함한 새로운 board_state 레코드를 반환한다.
    transition update_hits_and_misses(
        // 업데이트할 보드 레코드.
        board: board_state,
        // 이 플레이어의 이전 이동이 명중인지 실패인지에 대한 비트열 화성화 또는 실패.
        hit_or_miss: u64,
    ) -> board_state {
        // 명중과 실패를 업데이트한다.
        let hits_and_misses: u64 = board.hits_and_misses | hit_or_miss;

        return board_state {
            owner: board.owner,
            hits_and_misses,
            played_tiles: board.played_tiles,
            ships: board.ships,
            player_1: board.player_1,
            player_2: board.player_2,
            game_started: board.game_started,
        };
    }
}
