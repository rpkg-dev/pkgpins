# List all objects in a package's user-cache pins board

Lists all objects stored in a `pkg`'s user-cache pins board.

## Usage

``` r
ls_cache(board)
```

## Arguments

- board:

  [Package's user-cache pins
  board](https://pkgpins.rpkg.dev/dev/reference/board.md).

## Value

A [tibble](https://tibble.tidyverse.org/reference/tbl_df-class.html)
containing the columns `id`, `date_time_cached`, `file_size` and
`pins_api_version`.

## See also

Other package cache management functions:
[`board()`](https://pkgpins.rpkg.dev/dev/reference/board.md),
[`clear_cache()`](https://pkgpins.rpkg.dev/dev/reference/clear_cache.md),
[`path_cache()`](https://pkgpins.rpkg.dev/dev/reference/path_cache.md),
[`purge_cache()`](https://pkgpins.rpkg.dev/dev/reference/purge_cache.md),
[`purge_caches()`](https://pkgpins.rpkg.dev/dev/reference/purge_caches.md)
