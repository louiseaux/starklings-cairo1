# Primitive Types

## Overview

Cairo has several basic types that are directly implemented into the compiler, which are essential for building more complex data structures and functions. Understanding these primitive types is crucial as they form the foundation of Cairo programming. In this section, we’ll explore:

1. **Boolean Types:**
    - Booleans (`bool`) represent true or false values and are fundamental for control flow in programming. We will see how to define and use booleans in conditional statements.

2. **Integer Types:**
    - Cairo supports various integer types, such as `u8` and `u16`, which represent unsigned integers of different sizes. We will learn how to use these types, perform arithmetic operations, and prevent common issues like overflow.

3. **Tuples:**
    - Tuples allow us to group multiple values into a single compound value. We will practice destructuring tuples to access and manipulate individual elements effectively.

4. **Strings and felt252:**
    - Cairo represents short strings as `felt252` (field elements). We’ll explore how these representations work, how to convert between strings and numerical values, and the implications for printing and data handling.

By the end of this post, you’ll have a solid understanding of these basic types and how to use them in Cairo, setting a strong foundation for more advanced topics.

## Further Information

[Data Types](https://book.cairo-lang.org/ch02-02-data-types.html)

## Exercises

`primitive_types1.cairo`

### Errors

Our instructions tell us to complete the bit of code above. Let’s take a look at the error output for more context.

```
Compiling exercise_crate v0.1.0 (/Users/desmo/repos/starklings-cairo1/runner-crate/Scarb.toml)
error: Missing token TerminalUnderscore.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:15:8
    let // Finish the rest of this line like the example! Or make it be false!
       ^
error: Missing token TerminalEq.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:15:8
    let // Finish the rest of this line like the example! Or make it be false!
       ^
error: Missing token TerminalSemicolon.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:18:6
    }
     ^
error: Identifier not found.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:16:8
    if is_evening {
       ^********^
could not compile `exercise_crate` due to previous error
⚠️  Failed to run exercises/primitive_types/primitive_types1.cairo! Please try again.
```

The compiler provides useful hints such as `error: Missing token TerminalSemicolon`. and `error: Identifier not found.`. These indicate that we haven't completed the line of code, making it an incomplete statement. Let's fix this.

### Solution

As mentioned, we’re not done with the line of code on line 15. Observing the code above, we see that `is_morning` is assigned a `bool` value of `true`:

```
let is_morning = true;
```

Let’s do the same for `is_evening`. We can assign a `bool` value to it, either `true` or `false`. We'll start with `true`.

```
let is_evening = true;
```

With this change, the code compiles successfully! The output is:

```
Good morning!
Good evening!
✅ Successfully ran exercises/primitive_types/primitive_types1.cairo!
```

If we change the `bool` value to `false`, the output changes accordingly:

```
Good morning!
✅ Successfully ran exercises/primitive_types/primitive_types1.cairo!
```

Here’s the full functioning code:

```
fn main() {
    // Booleans (`bool`)

    let is_morning = true;
    if is_morning {
        println!("Good morning!");
    }

    let is_evening = true; 
    if is_evening {
        println!("Good evening!");
    }
}
```

### Explanation

1. **Variable Declaration and Initialization:**
    - Initially, the code uses `let` but doesn't assign any value to a variable.
    - Correcting it to `let is_evening = true;` initializes `is_evening` with the value `true` (or `false` if you prefer).

2. **Conditional Statement:**
    - The `if` statement checks whether `is_morning` and `is_evening` are `true` or `false`.
    - If either is `true`, it prints the appropriate message: `Good morning!` or `Good evening!` or even both.
    - If both are `false`, it prints nothing but still compiles correctly.

3. **Experimentation:**
    - Changing the values of `is_morning` and `is_evening` to different `bool` values and recompiling will result in different outputs based on the `if` condition.

Great let’s move on to the next exercise!

