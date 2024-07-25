# Variables

In Cairo, variables are immutable by default.
When a variable is immutable, once a value is bound to a name, you can’t change that value.
You can make them mutable by adding mut in front of the variable name.

It is however important to clarify the fact that even though the variable can be made mutable, Cairo works with an immutable memory model, meaning that changing the value of a variable will not change the value in memory but rather assign a new memory location to that variable.

## Further information

- [Memory model (from Cairo 0)](https://www.cairo-lang.org/docs/how_cairo_works/cairo_intro.html#memory-model)
- [Variables](https://book.cairo-lang.org/ch02-01-variables-and-mutability.html)
- [Integer types](https://book.cairo-lang.org/ch02-02-data-types.html#integer-types)

```
variables1.cairo
```

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

1. Identifier not found: The variable x is not declared before it is used.
2. Invalid left-hand side of assignment: The x needs to be declared properly.
3. Type annotations needed: The type of x is not inferred correctly by the compiler.

If you’re familiar with Rust, you’ll quickly spot that the issue is that the let keyword is missing.

### Explanation

1. Declaration with let: In Rust and Cairo, variables must be declared before they are used. The let keyword is used for this purpose. It tells the compiler that a new variable is being declared.

```
let x = 5;
```

2. Type Inference: While Rust and Cairo can infer types in many cases, constants and certain other values require explicit type annotations. In this example, type inference works fine because 5 is clearly an integer.

3. Printing Variables: The println! macro is used to print values. In this case, it prints the value of x.