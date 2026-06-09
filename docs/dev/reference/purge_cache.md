# Purge a package's user-cache pins board

Deletes *all* objects from a package's user-cache pins board. All boards
belonging to the same package as `board` are deleted, too.

## Usage

``` r
purge_cache(board)
```

## Arguments

- board:

  [Package's user-cache pins
  board](https://pkgpins.rpkg.dev/dev/reference/board.md).

## See also

Other package cache management functions:
[`board()`](https://pkgpins.rpkg.dev/dev/reference/board.md),
[`clear_cache()`](https://pkgpins.rpkg.dev/dev/reference/clear_cache.md),
[`ls_cache()`](https://pkgpins.rpkg.dev/dev/reference/ls_cache.md),
[`path_cache()`](https://pkgpins.rpkg.dev/dev/reference/path_cache.md),
[`purge_caches()`](https://pkgpins.rpkg.dev/dev/reference/purge_caches.md)
