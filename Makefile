# Invoke `make` to build, `make clean` to clean up, etc.

.PHONY: default all clean

default: all

# Build one library and one standalone executable that implements
# multiple subcommands and uses the library.
# The library can be loaded in utop for interactive testing.
# The flag "--profile release" is passed to avoid warnings-as-errors
all:
	dune runtest --profile release
	dune build --profile release @install 
	@test -L bin || ln -s _build/install/default/bin .

# Clean up
clean:
# Remove files produced by dune.
	dune clean
# Remove remaining files/folders ignored by git as defined in .gitignore (-X).
	git clean -dfXq

utop:
	dune utop . --profile release
