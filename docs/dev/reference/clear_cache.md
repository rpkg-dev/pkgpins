# Clear a package's user-cache pins board

Deletes all objects from a package's user-cache pins board that exceed a
certain `max_age`. If `board` is `pkg_versioned`, additionally deletes
all user-cache pins boards belonging to versions of the package other
than the currently installed one.

## Usage

``` r
clear_cache(board, max_age = "1 day")
```

## Arguments

- board:

  [Package's user-cache pins
  board](https://pkgpins.rpkg.dev/dev/reference/board.md).

- max_age:

  Age above which cached objects will be deleted. A valid [lubridate
  duration](https://lubridate.tidyverse.org/reference/as.duration.html).
  Defaults to 1 day (24 hours).

## Value

`board`, invisibly.

## Details

This function could be called on package load/unload, for example.

## See also

Other package cache management functions:
[`board()`](https://pkgpins.rpkg.dev/dev/reference/board.md),
[`ls_cache()`](https://pkgpins.rpkg.dev/dev/reference/ls_cache.md),
[`path_cache()`](https://pkgpins.rpkg.dev/dev/reference/path_cache.md),
[`purge_cache()`](https://pkgpins.rpkg.dev/dev/reference/purge_cache.md),
[`purge_caches()`](https://pkgpins.rpkg.dev/dev/reference/purge_caches.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# delete all cached results that are older than 7 days at once on package load:
.onLoad <- function(libname, pkgname) {
  pkgpins::clear_cache(board = pkgpins::board(pkg = pkgname),
                       max_age = "7 days")
}} # }
```
