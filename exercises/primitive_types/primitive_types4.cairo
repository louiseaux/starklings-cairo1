// primitive_types4.cairo
// Modify the integer types to make the tests pass.
// Learn how to convert between integer types, and felts.
// Execute `starklings hint primitive_types4` or use the `hint` watch subcommand for a hint.

use traits::Into;
use traits::TryInto;
use option::OptionTrait;

fn sum_u8s(x: u8, y: u8) -> u8 {
    x + y
}

// Modified the types of this function to prevent an overflow when summing big values
// from u8 to u16
fn sum_big_numbers(x: u16, y: u16) -> u16 {
    x + y
}

// Return x as a felt252
fn convert_to_felt(x: u8) -> felt252 {
    x.into() // use .into() method on x
}

// Return x as a u8
fn convert_felt_to_u8(x: felt252) -> u8 {
    x.try_into().unwrap() // use .try_into() with .unwrap() methods on x
}

#[test]
fn test_sum_u8s() {
    assert(sum_u8s(1, 2_u8) == 3_u8, 'Something went wrong');
}

#[test]
fn test_sum_big_numbers() {
    // Modified this test to use the correct integer types from u8 to u16
    assert(sum_big_numbers(255_u16, 255_u16) == 510_u16, 'Something went wrong');
}

#[test]
fn test_convert_to_felt() {
    assert(convert_to_felt(1_u8) == 1, 'Type conversion went wrong');
}

#[test]
fn test_convert_to_u8() {
    assert(convert_felt_to_u8(1) == 1_u8, 'Type conversion went wrong');
}
