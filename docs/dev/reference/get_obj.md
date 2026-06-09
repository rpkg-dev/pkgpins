# Get a cached object from a package's user-cache pins board

Retrieves a cached object from a package's user-cache pins board *if* it
is not older than `max_age`.

## Usage

``` r
get_obj(board, id, max_age = "1 day")
```

## Arguments

- board:

  [Package's user-cache pins
  board](https://pkgpins.rpkg.dev/dev/reference/board.md).

- id:

  Pin name uniquely identifying the object to be retrieved from the
  `pkg`'s user-cache pins board. A character scalar.

- max_age:

  Maximum age the cached object is allowed to have. A valid [lubridate
  duration](https://lubridate.tidyverse.org/reference/as.duration.html).
  Defaults to 1 day (24 hours).

## Value

The cached object if it is not older than `max_age`, otherwise `NULL`.

## See also

Other object handling functions:
[`cache_obj()`](https://pkgpins.rpkg.dev/dev/reference/cache_obj.md),
[`hash_fn_call()`](https://pkgpins.rpkg.dev/dev/reference/hash_fn_call.md),
[`is_cached()`](https://pkgpins.rpkg.dev/dev/reference/is_cached.md),
[`rm_obj()`](https://pkgpins.rpkg.dev/dev/reference/rm_obj.md)
