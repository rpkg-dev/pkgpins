# TODOs

- [ ] Experiment with using the [memoise](https://github.com/r-lib/memoise) package (development version if CRAN <= 1.1.0) internally instead of pins.

  Using `memoise::memoise()` in combo with `memoise::cache_filesystem()` and `memoise::timeout()` should be enough to achieve the crucial parts.
  
  If it is considerably faster than pins (if so, why?), a new pkg _pkgmemoise_ might make sense. To test pkgpins performance, a good choice is `swissevote::read_raw_data(canton = "Geneva", date = "?")`
  
  A first benchmark shows its overhead is pretty low and almost all delay caused by decompression:
  
  ```r
  bench::mark(indirect = swissevote::read_raw_data(canton = "Geneva",
                                                   ballot_date = "2018-06-10"),
              direct = readRDS("/home/salim/.cache/pins/pkg-cache-swissevote/swissevote-read_raw_data-canton='Geneva',ballot_date='2018-06-10'/data.rds"),
              check = FALSE,
              iterations = 10L)
  ```
  
  Note that the two results are not identical due to the `"AsIs"` attribute (which is currently the recommended way to avoid an additional CSV copy by `pins::pin()`):
  
  ```r
  diffobj::diffObj(readRDS("/home/salim/.cache/pins/pkg-cache-swissevote/swissevote-read_raw_data-canton='Geneva',ballot_date='2018-06-10'/data.rds"),
                   swissevote::read_raw_data(canton = "Geneva",
                                             ballot_date = "2018-06-10"))
  ```
  
  Open question: How can the compression mode of `pins::pin()` be changed? Would be cool to expose it as param of `pkgpins::cache_obj()`...

- [ ] Submit to CRAN

- [ ] Propose pkgpins usage for [BFS](https://github.com/lgnbhl/BFS) package
