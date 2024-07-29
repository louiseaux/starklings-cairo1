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

- [Data Types](https://book.cairo-lang.org/ch02-02-data-types.html)

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
⚠️  Failed to run exercises/primitive_types/primitive_types2.cairo! Please try again.
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

`primitive_types3`

### Errors

Here we have a very simple piece of code and our instructions are to destructure the `cat` tuple to allow us to call print on each of the members of the tuple. We already know the problem, but just so we are consistent, let's look at the errors.

```
Compiling exercise_crate v0.1.0 (/Users/desmo/repos/starklings-cairo1/runner-crate/Scarb.toml)
error: Missing token TerminalEq.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:10:12
    println!("name is {}", name);
           ^
error: Identifier not found.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:10:28
    println!("name is {}", name);
                           ^**^
error: Identifier not found.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:11:27
    println!("age is {}", age);
                          ^*^
warn: Unused variable. Consider ignoring by prefixing with `_`.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:8:9
    let cat = ('Furry McFurson', 3);
        ^*^
warn: Unused variable. Consider ignoring by prefixing with `_`.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:10:5
    println!("name is {}", name);
    ^*****^
error: Type annotations needed. Failed to infer ?2
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:10:14
    println!("name is {}", name);
             ^**********^
could not compile `exercise_crate` due to previous error
⚠️  Failed to run exercises/primitive_types/primitive_types3.cairo! Please try again.
```

We get a bunch of errors, but we know the cause we don’t have our tuple destructured to allow us to print `name` and `age`. So let's fix it!

### Solution

```
fn main() {
    let cat = ('Furry McFurson', 3);
    let (name, age) = cat;
    println!("name is {}", name);
    println!("age is {}", age);
}
```

Using the `(name, age)` syntax we can destructure the `('Furry McFurson', 3)` tuple into something that we can use later on in our print statements. This seems simple enough and our code compiles with these changes, so let's move on -- but wait, what do we see on the print out!?

```
name is 1429073786950451143196132410355566
age is 3
✅ Successfully ran exercises/primitive_types/primitive_types3.cairo!
```

The name we have in our program is `Furry McFurson` but we get a print out that says: `1429073786950451143196132410355566`, so what's going on here?

### Why Does the Output Show Numbers Instead of a String?

In Cairo, short strings are represented as `felt252` (field elements), which are large numerical values. This is why printing a short string directly might show a long number instead of the expected text.

The value `1429073786950451143196132410355566` is the result of encoding the entire string `Furry McFurson` into a single large integer. This encoding typically involves treating the string as a sequence of characters and converting each character into its corresponding ASCII (or Unicode) value, then packing these values into a large integer.

For simplicity, let’s break down a smaller example manually to understand how it works. I’ll also show you how to do it with ‘F’.

Example with a Single Character
Let’s take ‘F’. In decimal, it is `70`, which is straightforward. You can try this in the exercise and you will see `70` if you input `F`.

Example with a String
For a string like ‘Furry’, we need to consider how each character is converted and packed together. Here’s a basic explanation:

1. Convert each character to its `ASCII` value:

```
• ‘F’ -> 70
• ‘u’ -> 117
• ‘r’ -> 114
• ‘r’ -> 114
• ‘y’ -> 121
```

2. Pack these `ASCII` values together into a single large integer. This packing depends on the specific encoding scheme used. A simple scheme would be to treat the `ASCII` values as bytes in a large number.

Alright, let’s not dive in too deep into the weeds here and stay focused.

### Explanation

1. **Tuple Destructuring:**
    - The original problem requires us to destructure the tuple cat to access and print its individual elements. The solution correctly uses `(name, age)` to destructure the tuple.
    - By writing let `(name, age) = cat;`, the tuple `('Furry McFurson', 3)` is split into `name` and `age`.

2. **String Representation in Cairo:**
    - In Cairo, strings are represented as `felt252` (field elements), which are large numerical values.
    - When we print a string directly, it shows the numerical representation instead of the readable text. This is why `1429073786950451143196132410355566` appears instead of `Furry McFurson`.

Alright — let’s move on to our final exercise!

`primitive_types4.cairo`

### Errors

In this exercise we are tasked with modifying the integer types and `felt252` to make the tests pass, seems simple enough let’s take a look at the errors for any hints on how to fix this problem.

```
Compiling test(exercise_crate_unittest) exercise_crate v0.1.0 (/Users/desmo/repos/starklings-cairo1/runner-crate/Scarb.toml)
error: Unexpected return type. Expected: "core::felt252", found: "()".
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:21:38
fn convert_to_felt(x: u8) -> felt252 { //TODO return x as a felt252.
                                     ^*****************************^
error: Unexpected return type. Expected: "core::integer::u8", found: "()".
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:24:41
fn convert_felt_to_u8(x: felt252) -> u8 { //TODO return x as a u8.
                                        ^************************^
error: The value does not fit within the range of type core::integer::u8.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:38:47
    assert(sum_big_numbers(255_u8, 255_u8) == 510_u8, 'Something went wrong');
                                              ^****^
could not compile `exercise_crate` due to previous error
⚠️  Failed to run exercises/primitive_types/primitive_types4.cairo! Please try again.
```

Here we see that we have 3 main errors `Unexpected return type` which is for our unfinished functions, and `error: The value does not fit within the range of type core::integer::u8` which is telling us that the value doesn't fit in a `u8`. So let's fix this.

### Solution

This one is a little more involved, so let’s work through the solution step-by-step. As we know the tasks involve modifying types to prevent overflow and converting between integer types and `felt252`.

**Step 1: Prevent Overflow in sum_big_numbers**
The function `sum_big_numbers` currently takes `u8` types, which can hold values from `0` to `255`. Summing two `u8` values that are close to their maximum can cause an overflow. To prevent this, we’ll change the types to a larger integer type, such as `u16`, which can hold values from `0` to `65535`.

**Step 2: Implement convert_to_felt and convert_felt_to_u8**
For converting between `u8` and `felt252`, we’ll use the .into() and .try_into() traits.

**Step 3: Modify Tests**
Update the types in the test `test_sum_big_numbers` to reflect the changes made in the `sum_big_numbers` function.

Here’s the modified code:

```
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
```

with these these changes our code compiles and tests pass!

```
Compiling test(exercise_crate_unittest) exercise_crate v0.1.0 (/starklings-cairo1/runner-crate/Scarb.toml)
    Finished release target(s) in 1 second
running 4 tests
test exercise_crate::test_convert_to_felt ... ok (gas usage est.: 900)
test exercise_crate::test_sum_big_numbers ... ok (gas usage est.: 1670)
test exercise_crate::test_convert_to_u8 ... ok (gas usage est.: 2010)
test exercise_crate::test_sum_u8s ... ok (gas usage est.: 1670)
test result: ok. 4 passed; 0 failed; 0 ignored; 0 filtered out;
```

### Explanation

1. **Prevent Overflow:**
    - The function `sum_big_numbers` originally used `u8` types, which can only hold values from `0` to `255`. Summing two large `u8` values could cause an overflow.
    - To prevent this, we changed the parameter types from `u8` to `u16`. The `u16` type can hold values from `0` to `65535`, thus avoiding overflow when summing large values.

2. **Implement Conversion Functions:**
    - `convert_to_felt`: This function converts a `u8` value to a `felt252`. Using the `.into()` trait, the conversion is straightforward.
    - `convert_felt_to_u8`: This function converts a `felt252` value back to a `u8`. The `.try_into()` trait is used for this conversion, and `.unwrap()` ensures the conversion is successful. If it isn't, the program will panic.

3. **Modify Tests:**
    - Updated the `test_sum_big_numbers` test to use `u16` types for the values and the expected result. This matches the updated function signature and ensures the test values do not cause overflow.
    - The tests for conversion functions `test_convert_to_felt` and `test_convert_to_u8` confirm that the type conversions work as expected.

By modifying the integer types from `u8` to `u16`, we prevent overflow in the `sum_big_numbers` function. We implemented the conversion functions using `.into()` and `.try_into()` traits, ensuring seamless type conversions between `u8` and `felt252`. The tests were updated to reflect these changes, verifying that the functions operate correctly and the integer operations are safe from overflow.

## Conclusion
Alright, we’ve finished! Here’s a recap of what we covered:

1. **Basic Variable Initialization:**
    - We started with simple variable initialization and boolean checks. By defining and using boolean variables, we learned how to control the flow of our program based on conditional statements.

2. **Tuple Destructuring:**
    - We looked into tuple destructuring, which allowed us to break down composite data structures into individual elements. This helped us print and manipulate each member of a tuple effectively.

3. **Understanding Cairo’s String Representation:**
    - We discovered how Cairo represents short strings as `felt252`, which are large numerical values. We examined how these numerical values correspond to the original string and learned why they appear as large numbers when printed directly.

4. **Preventing Overflow:**
    - We addressed the issue of overflow by changing the integer types in our functions. By upgrading from `u8` to `u16`, we ensured that our functions could handle larger values without running into overflow problems.

5. **Type Conversion:**
    - We implemented functions to convert between different integer types and `felt252`. Using the `.into()` and `.try_into()` traits, we efficiently converted `u8` values to `felt252` and vice versa, ensuring compatibility and correctness in our operations.

6. **Modifying Tests:**
    - Throughout the exercises, we modified tests to verify the correctness of our functions. These tests ensured that our functions behaved as expected, handling edge cases and type conversions properly.

By working through these exercises, we’ve unlocked a deeper understanding of primitive types in Cairo and learned how to manipulate them effectively. We’ve mastered writing robust code that seamlessly handles various data types and skillfully avoids common pitfalls like overflow. These foundational skills are our stepping stones as we venture into more advanced and exciting topics in Cairo programming.