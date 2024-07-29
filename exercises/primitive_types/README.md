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

## Further Information

[Data Types](https://book.cairo-lang.org/ch02-02-data-types.html)

## Exercises

`primitive_types1.cairo`

### Errors

Let’s take a look at the error output for more context.

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

`primitive_types2.cairo`

### Errors

In this exercise, we are dealing with short strings in Cairo. A short string is a string whose length is at most 31 characters, and it can fit into a single field element (felt). Short strings are actually felts and not real strings. We need to use use single quotes for short strings.

```
Compiling exercise_crate v0.1.0 (/Users/desmo/repos/starklings-cairo1/runner-crate/Scarb.toml)
error: Missing token TerminalUnderscore.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:25:8
    let  // Finish this line like the example! What's your favorite short string?
       ^
error: Missing token TerminalEq.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:25:8
    let  // Finish this line like the example! What's your favorite short string?
       ^
error: Missing token TerminalSemicolon.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:37:6
    }
     ^
error: Identifier not found.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:28:13
        ref your_character
            ^************^
error: ref argument must be a variable.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:28:13
        ref your_character
            ^************^
error: Identifier not found.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:32:13
        ref your_character
            ^************^
error: ref argument must be a variable.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:32:13
        ref your_character
            ^************^
could not compile `exercise_crate` due to previous error
⚠️  Failed to run exercises/primitive_types/primitive_types1.cairo! Please try again.
```

The compiler errors indicate missing tokens such as `TerminalUnderscore` and `TerminalEq` and `TerminalSemicolon`. Additionally, a the key errors of `Identifier not found` and `ref arguement must be a variable` suggest that `your_character` is not correctly defined and referenced.

### Solution

To solve this, let’s complete the line that define’s `your_character`. Here's the solution:

```
fn main() {
let mut my_first_initial = 'C';
    if is_alphabetic(
        ref my_first_initial
    ) {
        println!(" Alphabetical !");
    } else if is_numeric(
        ref my_first_initial
    ) {
        println!(" Numerical !");
    } else {
        println!(" Neither alphabetic nor numeric!");
    }
    let mut your_character = 'E'; // Finishing the line here
    if is_alphabetic(
        ref your_character
    ) {
        println!(" Alphabetical !");
    } else if is_numeric(
        ref your_character
    ) {
        println!(" Numerical!");
    } else {
        println!(" Neither alphabetic nor numeric!");
    }
}
fn is_alphabetic(ref char: felt252) -> bool {
    if char >= 'a' {
        if char <= 'z' {
            return true;
        }
    }
    if char >= 'A' {
        if char <= 'Z' {
            return true;
        }
    }
    false
}
fn is_numeric(ref char: felt252) -> bool {
    if char >= '0' {
        if char <= '9' {
            return true;
        }
    }
    false
}
```

### Explanation

1. **Variable Declaration and Initialization:**
    - Initially, the code uses `let` without assigning any value to `your_character`.
    - Correcting it to `let mut your_character = 'A';` initializes `your_character` with a short string value, which can be a letter, number, or special character.

2. **Conditional Statement:**
    - The `if` statement checks whether `my_first_initial` and `your_character` are alphabetic or numeric.
    - If either is alphabetic, it prints `Alphabetical !`.
    - If either is numeric, it prints `Numerical !`.
    - Otherwise, it prints `Neither alphabetic nor numeric!`.

3. **Ref Keyword:**
    - The `ref` keyword is used to pass the variable by reference to the `is_alphabetic` and `is_numeric` functions.

4. **Experimentation:**
    - Changing the values of `my_first_initial` and `your_character` to different short string values and recompiling will result in different outputs based on the if condition.

You might have noticed that we used the `mut` keyword in the line `let mut your_character = 'E';` and if you tried to experiment with removing it, you'd notice that the code doesn't compile anymore so, let's make sure we understand why that is happening.

### Why Mutability is Necessary

1. **Exclusive Access:** The `ref` keyword indicates that the function requires an exclusive reference to the variable. This exclusive access might involve potential changes or ensuring that no other references exist to maintain data integrity during the function’s execution.

2. **Compiler Enforcement:** Rust and Cairo enforce immutability by default to ensure safety and prevent unintended side-effects. By requiring variables to be explicitly marked as mutable, the language ensures that developers are aware of where changes can occur, thus making the code more predictable and safer.

3. **Function Semantics:** The functions `is_alphabetic` and `is_numeric` in this context do not modify the variable, but the use of ref suggests a potential for future modifications or an exclusive read, necessitating the variable to be mutable.

By marking `your_character` as `mut`, you signal to the compiler and future readers of the code that `your_character` may be modified or requires exclusive access, aligning with the expected semantics of using `ref`.