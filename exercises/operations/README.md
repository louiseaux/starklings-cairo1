# Felt operations

## Overview

Felt, short for “field element,” is a fundamental type in the Cairo programming language, primarily used in zero-knowledge proof systems. Understanding felt operations is crucial for anyone working with Cairo, as it allows you to perform efficient arithmetic within the constraints of a finite field.

A field element (`felt`) is a native type in Cairo. You can think of it as a special kind of integer that behaves differently in certain arithmetic operations due to its properties within a finite field. This makes felts extremely useful for cryptographic computations, where operations need to be both efficient and secure.

Cairo1 also provides native integer types that support a wider range of operators compared to felts, such as `%` (modulus) and `/` (division). These integer types offer more flexibility for general arithmetic operations, but they lack some of the specialized behaviors of felts.

## Further Information

- [Felt Type](https://book.cairo-lang.org/ch02-02-data-types.html#felt-type)
- [Integer Types](https://book.cairo-lang.org/ch02-02-data-types.html#integer-types)

## Exercises

`operations1.cairo`