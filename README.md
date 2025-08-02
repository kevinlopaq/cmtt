# CMTT: Contextual Modal Type Theory

This is a prototype implementation of [**Contextual Modal Type Theory (CMTT)**](https://software.imdea.org/~aleks/papers/cmtt/cmtt.pdf), developed for academic use. It includes a bidirectional typechecker and an interpreter, along with a REPL interface for loading and evaluating CMTT programs.

## Features

- A **bidirectional typechecker** for CMTT  
- A **call-by-value interpreter**  
- A **REPL** for interactive use  
- A collection of **example programs** in the `examples/` directory  

## Disclaimer

This is a **research prototype**, developed to support formal and experimental work with CMTT. It is not intended for production use. Error handling is minimal, and the focus is on clarity and fidelity to the theory.

## Installation

You’ll need [GHC](https://www.haskell.org/ghc/) and [Cabal](https://www.haskell.org/cabal/). Then:

```bash
    git clone https://github.com/kevinlopaq/cmtt
    cd cmtt
    cabal build
```

## Usage

Run the REPL with:

```bash
    cabal run cmtt
```

Inside the REPL, the following commands are available:

- `typecheck <filename>` — Typeheck a program in the file  
- `run <filename>` — Typecheck and evaluate the file  
- `parse <filename>` — Parse and print the abstract syntax tree  
- `quit` — Exit the REPL  

## Directory Overview

- `src/` — Parser, typechecker, interpreter  
- `app/Main.hs` — REPL entry point  
- `examples/` — Sample programs  

## References and Related Work

> [Nanevski, A., Pfenning, F., & Pientka, B. (2008). *Contextual Modal Type Theory*](https://software.imdea.org/~aleks/papers/cmtt/cmtt.pdf).  
> [Pfenning, F., & Davies, R. (2001). *A Judgmental Reconstruction of Modal Logic*](https://www.cs.cmu.edu/~fp/papers/mscs00.pdf).  
> [mtt-lang: An implementation of Pfenning and Davies' modal type theory](https://github.com/mtt-lang).

## License

[MIT License](LICENSE)
