{

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function cleanup_t_uint160(value) -> cleaned {
        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
    }

    function cleanup_t_address(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function validator_revert_t_address(value) {
        if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
    }

    function abi_decode_t_address(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_address(value)
    }

    function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    function abi_encode_tuple_t_bool__to_t_bool__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function store_literal_in_memory_e8173140ee502f5920635dd04a65f885d670da7decbfc95900b88afa296abc40(memPtr) {

        mstore(add(memPtr, 0), "User is already registered")

    }

    function abi_encode_t_stringliteral_e8173140ee502f5920635dd04a65f885d670da7decbfc95900b88afa296abc40_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 26)
        store_literal_in_memory_e8173140ee502f5920635dd04a65f885d670da7decbfc95900b88afa296abc40(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_e8173140ee502f5920635dd04a65f885d670da7decbfc95900b88afa296abc40__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_e8173140ee502f5920635dd04a65f885d670da7decbfc95900b88afa296abc40_to_t_string_memory_ptr_fromStack( tail)

    }

    function abi_encode_t_address_to_t_address_fromStack(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function store_literal_in_memory_f9c1797c436bd1847554cf0cb188b2c2cdf17b88ade7e610385b7375418337db(memPtr) {

        mstore(add(memPtr, 0), "Deactivation called by this addr")

        mstore(add(memPtr, 32), "ess")

    }

    function abi_encode_t_stringliteral_f9c1797c436bd1847554cf0cb188b2c2cdf17b88ade7e610385b7375418337db_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 35)
        store_literal_in_memory_f9c1797c436bd1847554cf0cb188b2c2cdf17b88ade7e610385b7375418337db(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_address_t_stringliteral_f9c1797c436bd1847554cf0cb188b2c2cdf17b88ade7e610385b7375418337db__to_t_address_t_string_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 64)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        mstore(add(headStart, 32), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_f9c1797c436bd1847554cf0cb188b2c2cdf17b88ade7e610385b7375418337db_to_t_string_memory_ptr_fromStack( tail)

    }

}
