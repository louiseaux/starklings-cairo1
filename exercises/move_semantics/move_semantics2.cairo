// move_semantics2.cairo
// Make me compile without changing line 16 or moving line 13!
// Execute `starklings hint move_semantics2` or use the `hint` watch subcommand for a hint.

use array::ArrayTrait;
use debug::PrintTrait;

fn main() {
    let mut arr0 = ArrayTrait::new();

    fill_arr(ref arr0);

    // Do not change the following line!
    arr0.print();
}

fn fill_arr(ref arr: Array<felt252>) {
    arr.append(22);
    arr.append(44);
    arr.append(66);
}
