program verify.aleo {
    // 뒤집힌 비트의 수를 반환한다.
    // 예: 17870283321406128128u64, 이진수로는 11111000 00000000 00000000 00000000 00000000 00000000 00000000 00000000,
    // 반환 값은 5u64 이다.
    // 정확히 말하면 입력받은 숫자를 이진수로 변환한 뒤 1의 갯수를 반환해주는 함수다. 
    function bitcount(bits: u64) -> u64 {
        let r1: u64 = bits / 2u64;
        let r2: u64 = bits / 4u64;
        let r3: u64 = bits / 8u64;

        let r4: u64 = r1 & 8608480567731124087u64;
        let r5: u64 = r2 & 3689348814741910323u64;
        let r6: u64 = r3 & 1229782938247303441u64;

        let r7: u64 = bits - r4 - r5 - r6;

        let r8: u64 = r7 / 16u64;
        let r9: u64 = r7 + r8;
        let r10: u64 = r9 & 1085102592571150095u64;
        let r11: u64 = r10 % 255u64;

        return r11;
    }

    transition bitcount_test(bits: u64) -> u64 {
        let r1: u64 = bits / 2u64;
        let r2: u64 = bits / 4u64;
        let r3: u64 = bits / 8u64;

        let r4: u64 = r1 & 8608480567731124087u64;
        let r5: u64 = r2 & 3689348814741910323u64;
        let r6: u64 = r3 & 1229782938247303441u64;

        let r7: u64 = bits - r4 - r5 - r6;

        let r8: u64 = r7 / 16u64;
        let r9: u64 = r7 + r8;
        let r10: u64 = r9 & 1085102592571150095u64;
        let r11: u64 = r10 % 255u64;

        return r11;
    }

    // 모든 뒤집힌 비트가 "인접한"지 여부에 대한 부울 값을 반환한다.
    // 가로로는 모든 뒤집힌 비트가 직접 옆에 있어야 합니다 (111). 
    // 세로로는 모든 뒤집힌 비트가 7개의 뒤집히지 않은 비트로 구분되어 있어야 한다 (10000000100000001).
    function adjacency_check(
         // 8x8 그리드에서 배의 배치를 나타내는 u64 표현.
        ship: u64,
        // 배의 비트열을 가로 또는 세로로 나타낸 u64 표현.
        // 예: 길이 3의 배의 비트 문자열이 가로로는 다음과 같을 경우: 000111 = 7u64.
        // 세로로는 비트 문자열은 다음과 같을 것입니다: 10000000100000001 = 65793u64.
        orientation: u64,
    ) -> bool {
        // 이 연산의 결과는 0이 될 수 있습니다.
        let division: u64 = ship / orientation;

        // 0에서 1을 뺄셈하면 언더플로우가 발생할 수 있으므로 이 경계 사례를 확인해야 합니다.
        let is_eq: bool = division == 0u64;

        // 위의 나눗셈 결과가 0이면 인접성 검사가 false를 반환해야 합니다.
        // r4를 3 (11)으로 설정하면 여기서 실패가 보장됩니다.

        let ternary: u64 = is_eq ? 3u64 : division;
        let subtraction: u64 = ternary - 1u64;
        let and: u64 = subtraction & ternary;

        let bits_are_adjacent: bool = and == 0u64;

        return bits_are_adjacent;
    }

   
    transition adjacency_check_test(
         // 8x8 그리드에서 배의 배치를 나타내는 u64 표현.
        ship: u64,
        // 배의 비트열을 가로 또는 세로로 나타낸 u64 표현.
        // 예: 길이 3의 배의 비트 문자열이 가로로는 다음과 같을 경우: 000111 = 7u64.
        // 세로로는 비트 문자열은 다음과 같을 것입니다: 10000000100000001 = 65793u64.
        orientation: u64,
    ) -> bool {
        // 이 연산의 결과는 0이 될 수 있습니다.
        let division: u64 = ship / orientation;

        // 0에서 1을 뺄셈하면 언더플로우가 발생할 수 있으므로 이 경계 사례를 확인해야 합니다.
        let is_eq: bool = division == 0u64;

        // 위의 나눗셈 결과가 0이면 인접성 검사가 false를 반환해야 합니다.
        // r4를 3 (11)으로 설정하면 여기서 실패가 보장됩니다.

        let ternary: u64 = is_eq ? 3u64 : division;
        let subtraction: u64 = ternary - 1u64;
        let and: u64 = subtraction & ternary;

        let bits_are_adjacent: bool = and == 0u64;

        return bits_are_adjacent;
    }

     // 인접한 뒤집힌 비트가 행을 나누지 않는지 여부에 대한 부울 값을 반환한다.
    // 예: 111000000은 인접한 뒤집힌 비트를 가지고 있지만 행을 나눕니다: 00000001 11000000
    // 이 코드는 주어진 64비트 정수(여기서는 ship)에서 특정 가로 비트열(horizontal)을 
    // 사용하여 배의 배치가 8x8 그리드에서 인접한 뒤집힌 비트를 기준으로 행을 나누지 않는지 여부를 판별합니다. 코드의 원리를 단계별로 설명하겠습니다.
    function horizontal_check(
        // 8x8 그리드에서 배의 배치를 나타내는 u64 표현.
        ship: u64,
        // 배의 가로 비트열을 나타내는 u64 표현.
        horizontal: u64,
    ) -> bool {
        //ship의 값을 255u64로 나눈다. 
        // 나눗셈과 나머지 연산: ship을 255로 나누는 이유는 8x8 그리드의 각 행을 구분하기 위해서입니다. 
        //255(11111111 in binary)는 한 행에 있는 모든 비트가 1인 경우를 나타냅니다. 
        //ship % 255u64 연산을 통해 ship에서 각 행의 정보를 분리할 수 있습니다. 
        let remainder: u64 = ship % 255u64;

        // 이 연산의 결과는 0이 될 수 있습니다.
        //나눗셈의 결과 처리: 나머지 연산의 결과를 horizontal로 나눕니다. 
        //여기서의 아이디어는 horizontal 값이 ship의 한 행에서의 배치와 정확히 일치할 경우,
        // 나눗셈의 결과가 명확하게 0이 될 것이라는 점입니다.
        let division: u64 = remainder / horizontal;

        // 0에서 1을 뺄셈하면 언더플로우가 발생할 수 있다.
        let is_eq: bool = division == 0u64;

        // 3으로 설정하면 실패가 보장된다.
        let ternary: u64 = is_eq ? 3u64 : division;
        let subtraction: u64 = ternary - 1u64;
        let and: u64 = subtraction & ternary;

        let bits_split_row: bool = and == 0u64;

        return bits_split_row;
    }

    transition horizontal_check_test(
        // 8x8 그리드에서 배의 배치를 나타내는 u64 표현.
        ship: u64,
        // 배의 가로 비트열을 나타내는 u64 표현.
        horizontal: u64,
    ) -> bool {
        //ship의 값을 255u64로 나눈다. 
        //remainder = 34084860461056u64 % 31u64
        //remainder = 31u64
        let remainder: u64 = ship % 255u64;
        // return remainder;

        // // 이 연산의 결과는 0이 될 수 있습니다.
        // division = 31u64 / 31u64
        // division = 1u64
        let division: u64 = remainder / horizontal;
        //return division;

        // // 0에서 1을 뺄셈하면 언더플로우가 발생할 수 있다.
        // is_eq = 1u64 == 0u64
        // is_eq = false 
        let is_eq: bool = division == 0u64;
        //return is_eq; 

        // 3으로 설정하면 실패가 보장된다.
        // is_eq가 false기 때문에 division 값이 대입
        // 따라서 ternary는 1u64
        let ternary: u64 = is_eq ? 3u64 : division;
        //return ternary;
        
        //ternary가 1u64일 때 substraction은 0u64
        let subtraction: u64 = ternary - 1u64;
       
        // return subtraction;

        //subtraction은 0u64, ternary는 1u64 
        // and계산 후 and의 값은 0u64
        // 2개의 값이 같으면 1, 다르면 0 
        let and: u64 = subtraction & ternary;
        
        //and와 같으면 true, 다르면 false 
        let bits_split_row: bool = and == 0u64;

        //and와 같아서 true 예상
        return bits_split_row;
    }

    // 배치된 배가 유효한지 여부를 반환한다.
    transition validate_ship(
        // 8x8 그리드에서 배의 배치를 나타내는 u64 표현.
        ship: u64,
        // 배의 길이.
        length: u64,
        // 배의 가로 비트열 표현의 u64 등가물.
        horizontal: u64,
        // 배의 세로 비트열 표현의 u64 등가물.
        vertical: u64,
    ) -> bool {
        // 비트 수를 확인합니다. 다른 모든 유효성 검사는 올바른 비트 수에 의존한다.
        let num_bits: u64 = bitcount(ship);
        assert_eq(num_bits, length);

        // 배의 가로 비트를 확인합니다.
        let is_adjacent: bool = adjacency_check(ship, horizontal); // 비트가 가로로 인접한 경우 true.
        let is_horizontal: bool = horizontal_check(ship, horizontal); // 이 가로 비트가 행을 나누지 않는 경우 true.
        let valid_horizontal: bool = is_adjacent && is_horizontal; // 비트가 가로로 인접하며 행을 나누지 않으면 true.

        // 배의 세로 비트를 확인합니다.
        let valid_vertical: bool = adjacency_check(ship, vertical); // 비트가 세로로 인접한 경우 true.

        //두 변수 중에 하나라도 true면 true 반환
        let ship_is_valid: bool = valid_horizontal || valid_vertical; // 배는 세로 또는 가로로 유효한 경우입니다.

        //가로 또는 세로 중 하나 true 
        return ship_is_valid;
    }

        // 배치된 배가 유효한지 여부를 반환한다.
    transition validate_ship_test (
        // 8x8 그리드에서 배의 배치를 나타내는 u64 표현.
        ship: u64,
        // 배의 길이.
        length: u64,
        // 배의 가로 비트열 표현의 u64 등가물.
        horizontal: u64,
        // 배의 세로 비트열 표현의 u64 등가물.
        vertical: u64,
    ) -> bool {
        // 비트 수를 확인합니다. 다른 모든 유효성 검사는 올바른 비트 수에 의존한다.
        let num_bits: u64 = bitcount(ship);
        assert_eq(num_bits, length);

        // 배의 가로 비트를 확인합니다.
        let is_adjacent: bool = adjacency_check(ship, horizontal); // 비트가 가로로 인접한 경우 true.
        let is_horizontal: bool = horizontal_check(ship, horizontal); // 이 가로 비트가 행을 나누지 않는 경우 true.
        let valid_horizontal: bool = is_adjacent && is_horizontal; // 비트가 가로로 인접하며 행을 나누지 않으면 true.

        // 배의 세로 비트를 확인합니다.
        let valid_vertical: bool = adjacency_check(ship, vertical); // 비트가 세로로 인접한 경우 true.

        let ship_is_valid: bool = valid_horizontal || valid_vertical; // 배는 세로 또는 가로로 유효한 경우입니다.

        return ship_is_valid;
    }

    // 8x8 그리드에서 모든 배의 배치를 나타내는 u64 표현을 반환한다. 이 함수는 배의 배치가 서로 겹치면 실패한다.
    transition create_board(
        // 8x8 그리드에서 항공모함의 배치를 나타내는 u64 표현. 길이 = 5.
        carrier: u64,
        // 8x8 그리드에서 전함의 배치를 나타내는 u64 표현. 길이 = 4.
        battleship: u64,
        // 8x8 그리드에서 순양함의 배치를 나타내는 u64 표현. 길이 = 3.
        cruiser: u64,
        // 8x8 그리드에서 구축함의 배치를 나타내는 u64 표현. 길이 = 2.
        destroyer: u64,
    ) -> u64 {
        // 배치된 배를 비트별로 결합한다.
        let ships: u64 = carrier | battleship | cruiser | destroyer;

        let num_bits: u64 = bitcount(ships);
        assert_eq(num_bits, 14u64);  // 4개의 개별적으로 유효한 배의 경우, 유효한 조합은 정확히 14개의 뒤집힌 비트여야 한다.
        return ships;
    }

        // 8x8 그리드에서 모든 배의 배치를 나타내는 u64 표현을 반환한다. 이 함수는 배의 배치가 서로 겹치면 실패한다.
    transition create_board_test(
        // 8x8 그리드에서 항공모함의 배치를 나타내는 u64 표현. 길이 = 5.
        carrier: u64,
        // 8x8 그리드에서 전함의 배치를 나타내는 u64 표현. 길이 = 4.
        battleship: u64,
        // 8x8 그리드에서 순양함의 배치를 나타내는 u64 표현. 길이 = 3.
        cruiser: u64,
        // 8x8 그리드에서 구축함의 배치를 나타내는 u64 표현. 길이 = 2.
        destroyer: u64,
    ) -> u64 {
        // 배치된 배를 비트별로 결합한다.
        let ships: u64 = carrier | battleship | cruiser | destroyer;

        //num_bits를 했을 때 전체 1의 개수는 14가 나와야한다. 
        let num_bits: u64 = bitcount(ships);
        //return num_bits;

        //num_bits가 14가 맞는지 체크 
        assert_eq(num_bits, 14u64);  // 4개의 개별적으로 유효한 배의 경우, 유효한 조합은 정확히 14개의 뒤집힌 비트여야 한다.
        //다음은 1157459741006397447u64 이 값이 나올 것이다. 
        return ships;
    }
}
