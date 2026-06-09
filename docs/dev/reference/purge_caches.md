# Purge all package user-cache pins boards

Deletes the user-cache pins boards of *all* packages.

## Usage

``` r
purge_caches()
```

## Value

The deleted filesystem
[paths](https://fs.r-lib.org/reference/fs_path.html), invisibly. Of
length 0 if no package user-cache pins boards did exist.

## See also

Other package cache management functions:
[`board()`](https://pkgpins.rpkg.dev/dev/reference/board.md),
[`clear_cache()`](https://pkgpins.rpkg.dev/dev/reference/clear_cache.md),
[`ls_cache()`](https://pkgpins.rpkg.dev/dev/reference/ls_cache.md),
[`path_cache()`](https://pkgpins.rpkg.dev/dev/reference/path_cache.md),
[`purge_cache()`](https://pkgpins.rpkg.dev/dev/reference/purge_cache.md)
