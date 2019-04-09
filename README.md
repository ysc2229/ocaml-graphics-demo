# OCaml Graphics Demo

A simple project showcasing the `graphics` package of OCaml

## Setup

This project relies on OCaml's `graphics` package, which is somewhat
non-trivial to install, due to native system dependencies. Some
instructions on how make it work are provided below:

### Mac OS X

1. Install [XQuartz](https://www.xquartz.org/) or standalone 
   x11 window manager (via Homebrew):  

    ```
    brew install Caskroom/cask/xquartz 
    ```
2. After that, you will have to **re-install all packages** you have previously 
   installed via opam. For instance, first try

   ```
   ocaml switch
   ```

   If your version is, for instance `4.07.1`, next run

   ```
   opam switch reinstall 4.07.1
   ```

   It will take a while, as it re-builds all packages from scratch.

3. Next, execute

   ```
   opam update; opam upgrade 
   opam install graphics
   ```

   After that you should be able to build the project.

4. You might need to install the `ysc2229-part-one` and
   `ysc2229-part-two` libraries manually from the repositories (using
   `opam install .`).
 

### Linux

1. Make sure that x11 window manager is installed (it comes as a part
   of most of the standard distributions).

2. Proceed to Step 3 for Mac OS X (above).


### Windows

1. As it seems to be the case, x11 graphic interface is included into
   Cygwin (https://x.cygwin.com/).

2. Proceed to Step 3 for Mac OS X (above).


## Building and running this project

To build, run

```
make clean && make
```

To run the test application, after building the project execute

```
./bin/demo
```

and follow the instructions on the screen.

## More examples

You can find more examples of working with graphics in OCaml by
folloing
[this link](https://caml.inria.fr/pub/docs/oreilly-book/html/book-ora048.html).





