# TODOs

-   [ ] [Switch](https://pins.rstudio.com/articles/pins-update.html) to new pins API [introduced in v1.0.0](https://pins.rstudio.com/news/index.html)

    To create a package's user-cache pins board, use

    ``` r
    pins::board_folder(path = rappdirs::user_cache_dir(appname = paste0("pins/pkg-cache-", pkg)),
                       versioned = FALSE)
    ```

-   [ ] Submit to CRAN

-   [ ] Propose pkgpins usage for packages

    -   [BFS](https://github.com/lgnbhl/BFS)
    -   [swissdd](https://politanch.github.io/swissdd/) (unsure if caching makes sense -> investigate!)
    -   [swissparl](https://github.com/zumbov2/swissparl)
