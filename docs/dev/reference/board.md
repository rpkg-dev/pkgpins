# Get a package's user-cache pins board

Returns a `pkg`'s user-cache pins board. The board is automatically
created if it doesn't already exist.

## Usage

``` r
board(pkg, pkg_versioned = TRUE)
```

## Arguments

- pkg:

  Package name. A character scalar.

- pkg_versioned:

  Whether or not to make the board name dependent on `pkg`'s version
  number. If `FALSE`, the board is agnostic about `pkg`'s version
  number. Otherwise, a separate board is created for each `pkg` version
  number (e.g. after an upgrade).

## Value

The user-cache pins board belonging to `pkg` (and its version number if
`pkg_versioned = TRUE`). An object of class
[`pins_board_folder`](https://pins.rstudio.com/reference/board_folder.html).

## See also

Other package cache management functions:
[`clear_cache()`](https://pkgpins.rpkg.dev/dev/reference/clear_cache.md),
[`ls_cache()`](https://pkgpins.rpkg.dev/dev/reference/ls_cache.md),
[`path_cache()`](https://pkgpins.rpkg.dev/dev/reference/path_cache.md),
[`purge_cache()`](https://pkgpins.rpkg.dev/dev/reference/purge_cache.md),
[`purge_caches()`](https://pkgpins.rpkg.dev/dev/reference/purge_caches.md)
