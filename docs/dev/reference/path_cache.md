# Get a package's user-cache pins board path

Returns the filesystem path to the `pkg`'s user-cache pins board. Note
that this path depends on the operating system this function is called
from.

## Usage

``` r
path_cache(board)
```

## Arguments

- board:

  [Package's user-cache pins
  board](https://pkgpins.rpkg.dev/dev/reference/board.md).

## Value

A [path](https://fs.r-lib.org/reference/fs_path.html).

## Details

It shouldn't be necessary to rely on this function for the tasks this
package is intended to perform, though.

## See also

Other package cache management functions:
[`board()`](https://pkgpins.rpkg.dev/dev/reference/board.md),
[`clear_cache()`](https://pkgpins.rpkg.dev/dev/reference/clear_cache.md),
[`ls_cache()`](https://pkgpins.rpkg.dev/dev/reference/ls_cache.md),
[`purge_cache()`](https://pkgpins.rpkg.dev/dev/reference/purge_cache.md),
[`purge_caches()`](https://pkgpins.rpkg.dev/dev/reference/purge_caches.md)
