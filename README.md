A simple Brainf**ck interpreter written in 
[ATS2](https://github.com/githwxi/ATS-Postiats). It is completely memory safe
thanks to dependent types and other advanced type features of ATS. I would say
it's almost a "verified" implementation to some extent...?

After [installing ATS2](https://www.cs.bu.edu/~hwxi/atslangweb/Downloads.html),
you can compile the interpreter using the provided Makefile by typing `make`,
but it's also simple to compile it directly:

```bash
patscc -o brainfuck brainfuck_main.dats -DATS_MEMALLOC_GCBDW -lgc
```

Run an example program:
```bash
./brainfuck hello.bf
```

When not using GC, it's not 100% memory clean due to the usage of GC-allocated
`string`. You
can verify this by compiling without the flags `-DATS_MEMALLOC_GCBDW -lgc` and
run `valgrind ./brainfuck hello.bf`. It should be possible to achieve 100%
memory clean by replacing the usage of `string` with `Strnptr1`, but I'm still
figuring out how to elegantly use `Strnptr1` linearly.

The specification generally follows
[this](https://github.com/sunjay/brainfuck/blob/master/brainfuck.md) document,
with currently the key difference being that the tape size is fixed to 4096
cells, defined by `TAPE_SIZE`, instead of infinitely long. Just like the memory
clean issue I'm still thinking on how to expand the memory buffer in a linear
fashion.
