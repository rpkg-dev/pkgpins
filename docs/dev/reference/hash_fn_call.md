# Hash a function call

Creates a string that uniquely identifies a function call by the
function's name and a hash of the specified arguments.

## Usage

``` r
hash_fn_call(from_fn, ...)
```

## Arguments

- from_fn:

  Name of the function from which `hash_fn_call()` is called. A
  character scalar.

- ...:

  Arguments `from_fn` was called with. Any arguments omitted here won't
  be taken into account when generating the hash.

## Value

A character scalar.

## Details

This function does evaluate all arguments in `...`. I.e. the function
call `mypkg::foo(a = my_var)` will be cached as
"foo-ff6a1ba723cae45aeee265a71493cecf" if `my_var`'s value is `100`,
whereas it will become "foo-3f6860362d51e26829cc6f2f3b2968e9" if
`my_var`'s value is `101`. See examples below.

## See also

Other object handling functions:
[`cache_obj()`](https://pkgpins.rpkg.dev/dev/reference/cache_obj.md),
[`get_obj()`](https://pkgpins.rpkg.dev/dev/reference/get_obj.md),
[`is_cached()`](https://pkgpins.rpkg.dev/dev/reference/is_cached.md),
[`rm_obj()`](https://pkgpins.rpkg.dev/dev/reference/rm_obj.md)

## Examples

``` r
foo <- function(a, b = "default") pkgpins::hash_fn_call("foo", a, b)

foo("bar")
#> [1] "foo-782c297a474889e0e16c91d7218df53a"
a <- "bar"
foo(a)
#> [1] "foo-782c297a474889e0e16c91d7218df53a"
a <- "barbie"
foo(a)
#> [1] "foo-cfb2a469df5d0d7742cfd54f435a16f2"
a |> foo()
#> [1] "foo-cfb2a469df5d0d7742cfd54f435a16f2"
a |> foo(b = "default")
#> [1] "foo-cfb2a469df5d0d7742cfd54f435a16f2"

# you can also create a hash that is based on a subset of all function arguments
foo <- function(a, b = "default") pkgpins::hash_fn_call("foo", b)

foo("bar")
#> [1] "foo-70aa9861fd915a068381031ccbb9e55d"
foo("barrr")
#> [1] "foo-70aa9861fd915a068381031ccbb9e55d"
foo(b = "bar")
#> [1] "foo-3606446b81d5551067274d18bbff6700"
```
