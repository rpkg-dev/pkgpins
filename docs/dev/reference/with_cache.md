# Cache the result of an expression

One-stop solution to add caching to any R expression, for example from
within a function. See the examples.

## Usage

``` r
with_cache(
  expr,
  pkg,
  from_fn,
  ...,
  pkg_versioned = TRUE,
  use_cache = TRUE,
  max_cache_age = "1 day"
)
```

## Arguments

- expr:

  Expression to cache.

- pkg:

  Package name. A character scalar.

- from_fn:

  Name of the function that `expr` is cached from, i.e. the name of the
  function that `with_cache()` is called from. A character scalar.

- ...:

  Arguments received by `from_fn` on which the caching should depend.
  This is fundamental to determine whether `expr` was already cached or
  not. The arguments must be specified *unnamed* (see examples).
  [Dynamic dots](https://rlang.r-lib.org/reference/dyn-dots.html) are
  supported.

- pkg_versioned:

  Whether or not to make the caching dependent on the version number of
  `pkg`. If `FALSE`, caching is agnostic about `pkg`'s version number.
  Otherwise, a separate user-cache pins board is created each time
  `pkg`'s version number changes (e.g. after an upgrade), ensuring to
  never return cached results from a different (old) package version,
  irrespective of `max_cache_age`.

- use_cache:

  Whether or not to return cached results if possible. If `FALSE`,
  results are always newly fetched regardless of `max_cache_age`.

- max_cache_age:

  Duration after which cached results are refreshed (i.e. newly
  fetched). A valid [lubridate
  duration](https://lubridate.tidyverse.org/reference/as.duration.html).
  Use `Inf` to disable cache expiry. Only relevant if
  `use_cache = TRUE`.

## Value

The result of evaluating `expr`, from cache if `use_cache = TRUE` and a
cached result exists that hasn't exceeded `max_cache_age`.

## Details

`expr` is evaluated in the environment that `with_cache()` is called
from.

See
[`hash_fn_call()`](https://pkgpins.rpkg.dev/dev/reference/hash_fn_call.md)
for details about how the pin name is constructed that uniquely
identifies `expr` in the `pkg`'s user-cache pins board.

## See also

Other high-level functions:
[`cachely()`](https://pkgpins.rpkg.dev/dev/reference/cachely.md)

## Examples

``` r
# if the fn below would be part of a real package, we could instead define `this_pkg` globally
# using `this_pkg <- utils::packageName()`; instead, we now cache to pkgpins's cache (which
# itself never uses the cache)
this_pkg <- "pkgpins"

# let's define a fn that returns R pkg sys deps, cached
pkg_sys_deps <- function(pkg,
                         os = "ubuntu",
                         os_version = "24.04",
                         use_cache = TRUE,
                         max_cache_age = "6h") {
  pkgpins::with_cache(
    expr = purrr::list_flatten(jsonlite::fromJSON(
      txt = glue::glue("https://packagemanager.posit.co/__api__/repos/2/sysreqs",
                       "?all=false&pkgname={pkg}&distribution={os}&release={os_version}"),
      simplifyVector = FALSE
    )),
    pkg = this_pkg,
    from_fn = "pkg_sys_deps",
    pkg,
    use_cache = use_cache,
    max_cache_age = max_cache_age
  )
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
pkgpins::board(pkg = "pkgpins") |> pkgpins::purge_cache()
```
