# TODOs

- [ ] Experiment with using the [memoise](https://github.com/r-lib/memoise) package (development version if CRAN <= 1.1.0) internally instead of pins.

  Using `memoise::memoise()` in combo with `memoise::cache_filesystem()` and `memoise::timeout()` should be enough to achieve the crucial parts.
  If it is considerably faster than pins (if so, why? test e.g. with `swissevote::read_raw_data(canton = "Geneva")`), a new pkg _pkgmemoise_ might make sense.

- [ ] Submit to CRAN

- [ ] Propose pkgpins usage for [BFS](https://github.com/lgnbhl/BFS) package
