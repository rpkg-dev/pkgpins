# Add caching to a function

One-stop solution to turn a function into one with caching. The caching
is based on *all* arguments of `fn`. Use
[`with_cache()`](https://pkgpins.rpkg.dev/dev/reference/with_cache.md)
if you need more control.

## Usage

``` r
cachely(
  pkg,
  fn_name,
  fn,
  pkg_versioned = TRUE,
  use_cache = TRUE,
  max_cache_age = "1 day"
)
```

## Arguments

- pkg:

  Package name. A character scalar.

- fn_name:

  Name of the function to cache, i.e. the name of `fn`. A character
  scalar.

- fn:

  A function.

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

A modified version of `fn` that uses caching.

## Details

Note that the returned function has
[`...`](https://rdrr.io/r/base/dots.html) in its signature instead of
`fn`'s original formals. Use
[`with_cache()`](https://pkgpins.rpkg.dev/dev/reference/with_cache.md)
to create a function with a specific signature.

## See also

Other high-level functions:
[`with_cache()`](https://pkgpins.rpkg.dev/dev/reference/with_cache.md)

## Examples

``` r
# if the fn below would be part of a real package, we could instead define `this_pkg` globally
# using `this_pkg <- utils::packageName()`; instead, we now cache to pkgpins's cache (which
# itself never uses the cache)
this_pkg <- "pkgpins"

# create a sleep function that caches sleeping (if only humans could do the same!)
sleepless <- pkgpins::cachely(pkg = this_pkg,
                              fn_name = "sleepless",
                              fn = \(x) { Sys.sleep(x); x },
                              max_cache_age = "1 year")
# populate the cache...
sleepless(0.5)
#> [1] 0.5
sleepless(3)
#> [1] 3

# ... and never sleep the same amount of time again (for the next year)
sleepless(0.5)
#> [1] 0.5
sleepless(3)
#> [1] 3

# note that the function gained additional caching-related arguments...
formals(sleepless)
#> $x
#> 
#> 
#> $use_cache
#> [1] TRUE
#> 
#> $max_cache_age
#> [1] "1 year"
#> 

# ... so you can still coerce it to sleep
sleepless(3,
          use_cache = FALSE)
#> [1] 3

# purge cache from the above example
pkgpins::board(pkg = "pkgpins") |> pkgpins::purge_cache()
```
