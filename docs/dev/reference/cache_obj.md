# Cache an object to a package's user-cache pins board

Stores an object in `pkg`'s user-cache pins board, i.e. caches it to the
filesystem.

## Usage

``` r
cache_obj(board, x, id, qs_preset = c("fast", "balanced", "high", "archive"))
```

## Arguments

- board:

  [Package's user-cache pins
  board](https://pkgpins.rpkg.dev/dev/reference/board.md).

- x:

  Object to be cached.

- id:

  Pin name uniquely identifying `x` in the `pkg`'s user-cache pins
  board. A character scalar which is safe to use in paths of common file
  systems. Necessary to retrieve `x` again using
  [`get_obj()`](https://pkgpins.rpkg.dev/dev/reference/get_obj.md). An
  already existing pin named `id` will be silently overwritten.

- qs_preset:

  Compression level preset, mapped internally to
  [`qs2::qs_save()`](https://rdrr.io/pkg/qs2/man/qs_save.html)'s
  `compress_level` (`"fast"` = 1, `"balanced"` = 3, `"high"` = 7,
  `"archive"` = 22).

## Value

`x`, invisibly.

## Details

Note that `cache_obj()` will always overwrite an already existing cached
object of the same `id`. See
[`hash_fn_call()`](https://pkgpins.rpkg.dev/dev/reference/hash_fn_call.md)
for a convenient way to create an `id` that uniquely identifies a
function call. Or just use
[`with_cache()`](https://pkgpins.rpkg.dev/dev/reference/with_cache.md)
that internally relies on the former.

Note that reading in the cached result from the user-cache pins board
(i.e. from the filesystem) might produce a noticeable delay depending on
the size of the cached object. Therefore, it's only recommended to cache
results that take a considerable amount of time to recompute. To avoid
the overhead of re-reading a cached result when accessing it multiple
times, you can always assign it to an R variable to benefit from direct
storage in memory.

## See also

Other object handling functions:
[`get_obj()`](https://pkgpins.rpkg.dev/dev/reference/get_obj.md),
[`hash_fn_call()`](https://pkgpins.rpkg.dev/dev/reference/hash_fn_call.md),
[`is_cached()`](https://pkgpins.rpkg.dev/dev/reference/is_cached.md),
[`rm_obj()`](https://pkgpins.rpkg.dev/dev/reference/rm_obj.md)

## Examples

``` r
# if the fn below would be part of a real package, we could instead define `this_pkg` globally
# using `this_pkg <- utils::packageName()`; instead, we now cache to pkgpins's cache (which
# itself never uses the cache)
board <- pkgpins::board(pkg = "pkgpins")

# let's define a fn that returns R pkg sys deps from cache
pkg_sys_deps <- function(pkg,
                         os = "ubuntu",
                         os_version = "24.04",
                         use_cache = TRUE,
                         max_cache_age = "6h") {
  fetch <- TRUE

  if (use_cache) {
    pin_name <- pkgpins::hash_fn_call(from_fn = "pkg_sys_deps",
                                      pkg, os, os_version)
    result <- pkgpins::get_obj(board = board,
                               id = pin_name,
                               max_age = max_cache_age)
    fetch <- is.null(result)
  }
  
  if (fetch) {
    result <-
      jsonlite::fromJSON(txt = glue::glue("https://packagemanager.posit.co/__api__/repos/2/sysreqs",
                                          "?all=false&pkgname={pkg}&distribution={os}",
                                          "&release={os_version}"),
                         simplifyVector = FALSE) |>
      purrr::list_flatten()
  }
 
  if (use_cache && fetch) {
    pkgpins::cache_obj(board = board,
                       x = result,
                       id = pin_name)
  }

  result
}

# now get the sys deps for git2r for the first time (populating the cache)
pkg_sys_deps("git2r")
#> $requirements
#> $requirements$name
#> [1] "git2r"
#> 
#> $requirements$requirements
#> $requirements$requirements$packages
#> $requirements$requirements$packages[[1]]
#> [1] "libgit2-dev"
#> 
#> $requirements$requirements$packages[[2]]
#> [1] "libssh2-1-dev"
#> 
#> $requirements$requirements$packages[[3]]
#> [1] "libssl-dev"
#> 
#> 
#> $requirements$requirements$install_scripts
#> $requirements$requirements$install_scripts[[1]]
#> [1] "apt-get install -y libgit2-dev"
#> 
#> $requirements$requirements$install_scripts[[2]]
#> [1] "apt-get install -y libssh2-1-dev"
#> 
#> $requirements$requirements$install_scripts[[3]]
#> [1] "apt-get install -y libssl-dev"
#> 
#> 
#> 
#> 

if (FALSE) { # \dontrun{
# for the `max_cache_age` (we've set a default of 6h), the cached result will be returned
# (as long as `use_cache = TRUE`):
bench::mark("with cache" = pkg_sys_deps("git2r"),
            "without cache" = pkg_sys_deps("git2r", use_cache = FALSE),
            iterations = 10,
            relative = TRUE)} # }

# purge cache from the above example
pkgpins::purge_cache(board = board)
```
