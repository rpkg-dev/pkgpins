# pkgpins: Facilitates Results Caching in R Packages Using the Pins Package

pkgpins builds upon the pins package and strives to provide R package authors a simple and standardized way to cache results on the filesystem in a suitable user directory.

## Predefined parameter labels

There are two predefined parameter labels available in [pkgsnip](https://gitlab.com/salim_b/r/pkgs/pkgsnip) which fit typical use cases of this package. They are intended to be used in `@param` [roxygen2 tags](https://roxygen2.r-lib.org/articles/rd.html#functions)[^1] as follows:

``` r
#' @param cache_lifespan `r pkgsnip::param_label("cache_lifespan")`
#' @param use_cache `r pkgsnip::param_label("use_cache")`
```

The above inline R code will eventually result in this:

``` r
#' @param cache_lifespan The duration after which cached results are refreshed (i.e. newly fetched). A valid [lubridate duration][lubridate::as.duration]. Only relevant if `use_cache = TRUE`.
#' @param use_cache Return cached results if possible. If `FALSE`, results are always newly fetched regardless of `cache_lifespan`.
```

## Installation

To install the latest development version of pkgpins, run the following in R:

``` r
if (!("remotes" %in% rownames(installed.packages()))) {
  install.packages(pkgs = "remotes",
                   repos = "https://cloud.r-project.org/")
}

remotes::install_gitlab(repo = "salim_b/r/pkgs/pkgpins")
```

## Development

### R Markdown format

This package’s source code is written in the [R Markdown](https://rmarkdown.rstudio.com/) file format to facilitate practices commonly referred to as [*literate programming*](https://en.wikipedia.org/wiki/Literate_programming). It allows the actual code to be freely mixed with explanatory and supplementary information in expressive Markdown format instead of having to rely on [`#` comments](https://cran.r-project.org/doc/manuals/r-release/R-lang.html#Comments) only.

All the `-GEN.R` suffixed R source code found under [`R/`](R/) is generated from the respective R Markdown counterparts under [`Rmd/`](Rmd/) using [`pkgpurl::purl_rmd()`](https://gitlab.com/salim_b/r/pkgs/pkgpurl/)[^2]. Always make changes only to the `.Rmd` files – never the `.R` files – and then run `pkgpurl::purl_rmd()` to regenerate the R source files.

### Coding style

This package borrows a lot of the [Tidyverse](https://www.tidyverse.org/) design philosophies. The R code adheres to the principles specified in the [Tidyverse Design Guide](https://principles.tidyverse.org/) wherever possible and is formatted according to the [Tidyverse Style Guide](https://style.tidyverse.org/) (TSG) with the following exceptions:

-   Line width is limited to **160 characters**, double the [limit proposed by the TSG](https://style.tidyverse.org/syntax.html#long-lines) (80 characters is ridiculously little given today’s high-resolution wide screen monitors).

-   Usage of [magrittr’s compound assignment pipe-operator `%<>%`](https://magrittr.tidyverse.org/reference/compound.html) is desirable[^3].

-   Usage of [R’s right-hand assignment operator `->`](https://rdrr.io/r/base/assignOps.html) is not allowed[^4].

-   R source code is *not* split over several files as [suggested by the TSG](https://style.tidyverse.org/package-files.html) but instead is (as far as possible) kept in the single file [`Rmd/pkgpins.Rmd`](Rmd/pkgpins.Rmd) which is well-structured thanks to its [Markdown support](#r-markdown-format).

As far as possible, these deviations from the TSG plus some additional restrictions are formally specified in the [lintr configuration file](https://github.com/jimhester/lintr#project-configuration) [`.lintr`](.lintr), so lintr can be used right away to check for formatting issues:

``` r
pkgpurl::lint_rmd()
```

## See also

-   R packages that provide a [memoization](http://en.wikipedia.org/wiki/Memoization) infrastructure. Memoization is suited best for caching [purely functional programming](https://en.wikipedia.org/wiki/Purely_functional_programming) results, i.e. caching functions that always return the same result with the same arguments – something that’s often not the case for functions accessing external APIs.

    There are at least two actively developed memoization packages:

    -   The Tidyverse-style [**memoise**](https://github.com/r-lib/memoise) package.
    -   The [**R.cache**](https://github.com/HenrikBengtsson/R.cache) package.

---

[^1]: Support for dynamic inline R code was introduced in [roxygen2 7.1.0](https://www.tidyverse.org/blog/2020/03/roxygen2-7-1-0/).

[^2]: This naming convention as well as the very idea to leverage the R Markdown format to author R packages was originally proposed by Yihui Xie. See his excellent [blog post](https://yihui.name/rlp/) for more detailed information about the benefits of literate programming techniques and some practical examples. Note that using `pkgpurl::purl_rmd()` is a less cumbersome alternative to the Makefile approach outlined by him.

[^3]: The TSG [explicitly instructs to avoid this operator](https://style.tidyverse.org/pipes.html#assignment-2) – presumably because it’s relatively unknown and therefore might be confused with the forward pipe operator `%>%` when skimming code only briefly. I don’t consider this to be an actual issue since there aren’t many sensible usage patterns of `%>%` at the beginning of a pipe sequence inside a function – I can only think of creating side effects and relying on [R’s implicit return of the last evaluated expression](https://rdrr.io/r/base/function.html). Therefore – and because I really like the `%<>%` operator – it’s usage is welcome.

[^4]: The TSG [explicitly accepts `->` for assignments at the end of a pipe sequence](https://style.tidyverse.org/pipes.html#assignment-2) while Google’s R Style Guide [considers this bad practice](https://google.github.io/styleguide/Rguide.html#right-hand-assignment) because it “makes it harder to see in code where an object is defined”. I second the latter.
