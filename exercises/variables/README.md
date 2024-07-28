# Variables

In Cairo, variables are immutable by default.
When a variable is immutable, once a value is bound to a name, you can’t change that value.
You can make them mutable by adding `mut` in front of the variable name.

It is however important to clarify the fact that even though the variable can be made mutable, Cairo works with an immutable memory model, meaning that changing the value of a variable will not change the value in memory but rather assign a new memory location to that variable.

## Further information

- [Memory model (from Cairo 0)](https://www.cairo-lang.org/docs/how_cairo_works/cairo_intro.html#memory-model)
- [Variables](https://book.cairo-lang.org/ch02-01-variables-and-mutability.html)
- [Integer types](https://book.cairo-lang.org/ch02-02-data-types.html#integer-types)

## Exercises

`variables1.cairo`

### Errors

Our first exercise shows a basic function that is giving us an error:

```
Compiling exercise_crate v0.1.0 (/starklings-cairo1/runner-crate/Scarb.toml)
error: Identifier not found.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:10:5
    x = 5 ;
    ^

error: Invalid left-hand side of assignment.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:10:5
    x = 5 ;
    ^
error: Identifier not found.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:11:26
    println!(" x is {}", x)
                         ^
error: Type annotations needed. Failed to infer ?4
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo[println_macro][writeln_macro]:4:22
    match core::fmt::Display::fmt(__write_macro_arg0__, ref __formatter_for_print_macros__) {
                     ^*****^
could not compile `exercise_crate` due to previous error
⚠️  Failed to run exercises/variables/variables1.cairo! Please try again.
```

The errors indicate several issues:

1. **Identifier not found:** The variable `x` is not declared before it is used.
2. **Invalid left-hand side of assignment:** The `x` needs to be declared properly.
3. **Type annotations needed:** The type of `x` is not inferred correctly by the compiler.

If you’re familiar with Rust, you’ll quickly spot that the issue is that the `let` keyword is missing.

### Solution

```
fn main() {
    let x = 5; // adding `let` before `x`
    println!(" x is {}", x)
}
```

### Explanation

1. **Declaration with `let`:** In Rust and Cairo, variables must be declared before they are used. The `let` keyword is used for this purpose. It tells the compiler that a new variable is being declared.

```
let x = 5;
```

2. **Type Inference:** While Rust and Cairo can infer types in many cases, constants and certain other values require explicit type annotations. In this example, type inference works fine because `5` is clearly an integer.

3. **Printing Variables:** The `println!` macro is used to print values. In this case, it prints the value of `x`.

`variables2.cairo`

### Errors

Here we have another simple function with an `x` variable as well as an `if` statement that compares `x` to `10` but it's not compiling. Let's look at our errors:

```
Compiling exercise_crate v0.1.0 (/starklings-cairo1/runner-crate/Scarb.toml)
error: Missing token TerminalEq.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:8:10
    let x;
         ^
error: Missing tokens. Expected an expression.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:8:10
    let x;
         ^
error: Unsupported feature.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:8:10
    let x;
         ^
could not compile `exercise_crate` due to previous error
⚠️  Failed to run exercises/variables/variables3.cairo! Please try again.
```

It’s pretty clear that our first line in our function is not correct syntax and should be written differently, the compiler tells us that we’re `Missing tokens. Expected an expression.` So let's fix it.

### Solution

As we saw in the first exercise that was missing the `let` keyword before `x` this exercise is missing the value we want `x` to be. We fix that by adding the _assignment operator_ `=` and an actual value.

```
let x;
// to
let x = 10;
```

Now depending on what value we use we’ll get different outputs as we can see with the `else` part of the `if` statement. Feel free to experiment and recompile with different numbers as the `x` value and see what happens. But here's a solution with the value `1`. This would of course print: `x is not ten!`.

```
fn main() {
    let x = 1;
    if x == 10 {
       println!("x is ten! ");
    } else {
        println!("x is not ten! ");
    }
}
```

### Explanation

1. **Variable Declaration and Initialization:**
    - In the initial code, `let x;` declares the variable `x` but does not initialize it with a value, which is why the compiler throws an error.
    - Correcting it to `let x = 10;` initializes `x` with the value `10`.

2. **Conditional Statement:**
    - The `if` statement checks whether `x` is equal to `10`.
    - If `x` equals `10`, it prints `x is ten!`.
    - Otherwise, it prints `x is not ten!`.

3. **Experimentation:**
    - Changing the value of `x` to different numbers and recompiling will result in different outputs based on the `if` condition.

So far so good right? It’s pretty straight forward. Let’s move on to exercise 3.

`variables3.cairo`

### Errors

Here we see another similar scenario as exercise 2, but we see a different type of syntax the `: felt252` after the variable `x`. Let's look at the errors.

```
Compiling exercise_crate v0.1.0 (/Users/desmo/repos/starklings-cairo1/runner-crate/Scarb.toml)
error: Missing token TerminalEq.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:9:19
    let x: felt252;
                  ^
error: Missing tokens. Expected an expression.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:9:19
    let x: felt252;
                  ^
error: Unsupported feature.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:9:19
    let x: felt252;
                  ^
could not compile `exercise_crate` due to previous error
⚠️  Failed to run exercises/variables/variables3.cairo! Please try again.
```

The errors indicate that the expression is incomplete. Specifically, the variable `x` is declared with a type `felt252` but is not initialized with a value.

### Solution

In Cairo, as in Rust, you can specify types after variables. This is beneficial for clarity and type safety. Although the Cairo compiler often infers the type (defaulting to `felt252` if unspecified), it's good practice to explicitly declare types, especially for beginners.

To fix the error, we need to initialize `x` with a value by adding the _assignment operator_ `=` and the value.

This is what the updated code looks like:

```
fn main() {
    let x: felt252 = 10;
    println!("x is {}", x);
}
```

### Explanation

1. **Type Annotation:**
    - `let x: felt252;` declares a variable `x` of type `felt252` but does not initialize it.
    - The compiler needs both declaration and initialization.

2. **Assignment Operator:**
    - Adding 10 initializes `x` with the value `10`.

3. **Printing the Variable:**
    - `println!("x is {}", x);` prints the value of `x`.

This exercise reinforces the importance of initializing variables and understanding type annotations in Cairo. Let’s move on to the next exercise.

`variables4.cairo`

### Errors

This seems like a pretty simple exercise, and we’re told that we’re not allowed to change the `x = 5` line. But let's look at the errors and see if there's a hint as to how to fix our error.

```
Compiling exercise_crate v0.1.0 (/Users/desmo/repos/starklings-cairo1/runner-crate/Scarb.toml)
error: Cannot assign to an immutable variable.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:10:5
    x = 5; // don't change this line
    ^***^
could not compile `exercise_crate` due to previous error
⚠️  Failed to run exercises/variables/variables4.cairo! Please try again.
```

The key part of the output is: `error: Cannot assign to an immutable variable.` If you're familiar with Rust, and now looking at Cairo, we need to remember that variables are _immutable_ by default. This means that we cannot simply assign a new value but must declare the variable that we want to modify as mutable. So let's see how we fix this.

### Solution

In Cairo, variables are immutable by default, similar to Rust (we’ll keep on reminding you). This means that you cannot reassign a value to a variable unless it is declared as mutable using the `mut` keyword.

In this exercise, we are trying to assign `x` to `5` after we've already assigned `x` to `3` on line 8. This won't work unless we put the `mut` keyword in front of `x`.

Here’s the updated code:

```
fn main() {
    let mut x = 3; // add `mut` keyword
    println!("x is {}", x);
    x = 5; // don't change this line
    println!("x is now {}", x);
}
```

With this simple update we can now see that our code compiles and we successfully update the value of `x`.

### Explanation

1. **Immutability by Default:**
    - In Cairo variables are immutable by default. This means that once a variable is assigned a value, it cannot be changed unless explicitly declared as mutable.

2. **Mutable Variables:**
    - To make a variable mutable, you need to use the `mut` keyword. This allows you to reassign values to the variable.

3. **Assignment and Reassignment:**
    - The line `let x = 3;` declares an immutable variable `x` and assigns it the value `3`.
    - Trying to reassign `x` to `5` (`x = 5;`) without making `x` mutable results in a compilation error.
    - Adding `mut` (`let mut x = 3;`) makes `x` mutable, allowing reassignment.

By making this simple update, our code compiles, and we successfully update the value of `x`.

For more detailed information on variables and mutability in Cairo, you can refer to the [Variables and Mutability](https://book.cairo-lang.org/ch02-01-variables-and-mutability.html) chapter in the Cairo book.

`variables5.cairo`

### Errors

In `variables5.cairo`, we face a similar exercise to `variables4.cairo`, but with an additional challenge: we can't change the line `let number = 1_u8`, and we also cannot rename the variable `number` on line 10. So, what can we do? Let's see if the compiler can help.

```
Compiling exercise_crate v0.1.0 (/Users/desmo/repos/starklings-cairo1/runner-crate/Scarb.toml)
error: Cannot assign to an immutable variable.
 --> /Users/desmo/repos/starklings-cairo1/runner-crate/src/lib.cairo:10:5
    number = 3; // don't rename this variable
    ^********^

could not compile `exercise_crate` due to previous error
⚠️  Failed to run exercises/variables/variables5.cairo! Please try again.
```

This output looks familiar — it’s the same as the previous exercise. Since we can’t use `mut`, we need to find another solution. Experienced Rust programmers might already know what to do here: **variable shadowing**.

### Solution

Let’s repeat it one more time! In Cairo, variables are immutable by default, but we can use a technique called shadowing. Shadowing allows us to declare a new variable with the same name as a previous variable, effectively creating a new variable that can hold a different value or type.

Shadowing is done using the `let` keyword again with the same variable name. This might seem confusing at first, but it's quite powerful as it allows us to reuse variable names within different scopes or with different types.

Here’s the updated code:

```
fn main() {
    let number = 1_u8; // don't change this line
    println!("number is {}", number);
    let number = 3; // don't rename this variable
    println!("number is {}", number);
}
```

### Explanation

**Shadowing:**
- Shadowing allows you to declare a new variable with the same name as a previous variable. This new variable can have a different value or type.
- `let number = 1_u8;` declares the first `number` with a type of `u8` and value `1`.
- `let number = 3;` declares a new `number` variable, shadowing the previous one. This new `number` can have a different type or value.

### Why Shadowing?

Shadowing is useful because:
- It allows reusing variable names without mutating the original variable.
- It helps in maintaining cleaner code by avoiding unnecessary variable names.
- It allows changing the type of a variable within a certain scope.

For more information on shadowing, you can refer to the [Variables and Mutability](https://book.cairo-lang.org/ch02-01-variables-and-mutability.html?highlight=shadow#shadowing) chapter in the Cairo book.

Alright, let’s move on to our final `variables` exercise!