// variables4.cairo
// Execute `starklings hint variables4` or use the `hint` watch subcommand for a hint.

use debug::PrintTrait;

fn main() {
    let mut x = 3; let mut x = 3; // add `mut` keyword
    println!("x is {}", x);
    x = 5; // don't change this line
    println!("x is now {}", x);
}
