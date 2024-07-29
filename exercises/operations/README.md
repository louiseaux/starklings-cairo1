# Felt operations

## Overview

Felt, short for “field element,” is a fundamental type in the Cairo programming language, primarily used in zero-knowledge proof systems. Understanding felt operations is crucial for anyone working with Cairo, as it allows you to perform efficient arithmetic within the constraints of a finite field.

A field element (`felt`) is a native type in Cairo. You can think of it as a special kind of integer that behaves differently in certain arithmetic operations due to its properties within a finite field. This makes felts extremely useful for cryptographic computations, where operations need to be both efficient and secure.

Cairo1 also provides native integer types that support a wider range of operators compared to felts, such as `%` (modulus) and `/` (division). These integer types offer more flexibility for general arithmetic operations, but they lack some of the specialized behaviors of felts.

## Further Information

- [Felt type](https://book.cairo-lang.org/ch02-02-data-types.html#felt-type)
- [Integer types](https://book.cairo-lang.org/ch02-02-data-types.html#integer-types)

## Exercises

`operations1.cairo`

### Errors

First, we are being told here that we should avoid `Felt252` operations where possible, because it could have unwanted behavior. Our task given is to return the solution of `x^3 + y -2`, we're also told not to modify the test functions.

Alright, let’s take a quick look at the errors for completeness.

```
Compiling test(exercise_crate_unittest) exercise_crate v0.1.0 (/Users/desmo/repos/starklings-cairo1/runner-crate/Scarb.toml)
error: Identifier not found.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:11:5
    res // Do not change
    ^*^
could not compile `exercise_crate` due to previous error
⚠️  Failed to run exercises/operations/operations1.cairo! Please try again.
```

Not much to see here, our test is failing.

### Solution

Our task is to make these tests pass, but as we know, it’s a little tricky to work with some operations in Cairo. Let’s take a look at what we have in `fn poly`. We see that we have two parameters in `poly(x:, y)`, and our problem with `x^3` is really `x * x * x`, so why don’t we calculate that separately and see what happens?

If we add a variable `x_cubed` to calculate that, then use it on the next line with the `res` variable, we can get our code to compile:

```
fn poly(x: usize, y: usize) -> usize {
    let x_cubed = x * x * x;
    let res = x_cubed + y - 2;
    res // Do not change
}
```

### Explanation

1. **Integer Types and Arithmetic Operations:**
• The task specifies using `usize` integers for our calculations. Cairo has native integer types that support basic arithmetic operations such as addition, subtraction, and multiplication.

2. **Avoiding Felt252 Operations:**
• `Felt252` operations can have unexpected behavior, so we’re instructed to use integer types where possible. This helps avoid potential pitfalls in arithmetic operations within the Cairo environment.

3. **Calculating Powers:**
• Since Cairo does not support direct exponentiation for integers like `x^3`, we manually calculate the cube by multiplying x three times: `x * x * x`.

4. **Variable Initialization:**
• We introduce a new variable `x_cubed` to store the result of `x * x * x`. This makes the code cleaner and easier to understand.
• Then we calculate res by adding `x_cubed` to `y` and subtracting `2`, which is the required expression.

5. **Test Function:**
• The provided test function checks multiple conditions to ensure our implementation is correct. It verifies the result against various assertions, ensuring the value of res meets all specified criteria.

Let’s move on to the next exercise.
