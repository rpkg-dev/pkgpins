# Test whether an object exists in a package's user-cache pins board

Returns `TRUE` if the object is present in the `pkg`'s user-cache pins
board and hasn't exceeded `max_age`, otherwise `FALSE`.

## Usage

``` r
is_cached(board, id, max_age = "1 day")
```

## Arguments

- board:

  [Package's user-cache pins
  board](https://pkgpins.rpkg.dev/dev/reference/board.md).

- id:

  Pin name uniquely identifying the object to be checked in the `pkg`'s
  user-cache pins board. A character scalar.

- max_age:

  Maximum age the cached object is allowed to have. A valid [lubridate
  duration](https://lubridate.tidyverse.org/reference/as.duration.html).
  Defaults to 1 day (24 hours).

## Value

A character scalar, or `NULL` if no cached object exists that hasn't
exceeded `max_age`.

## See also

Other object handling functions:
[`cache_obj()`](https://pkgpins.rpkg.dev/dev/reference/cache_obj.md),
[`get_obj()`](https://pkgpins.rpkg.dev/dev/reference/get_obj.md),
[`hash_fn_call()`](https://pkgpins.rpkg.dev/dev/reference/hash_fn_call.md),
[`rm_obj()`](https://pkgpins.rpkg.dev/dev/reference/rm_obj.md)
