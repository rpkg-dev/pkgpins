# Delete a cached object from a package's user-cache pins board

Removes a cached object from a package's user-cache pins board.

## Usage

``` r
rm_obj(board, id)
```

## Arguments

- board:

  [Package's user-cache pins
  board](https://pkgpins.rpkg.dev/dev/reference/board.md).

- id:

  Pin name uniquely identifying the object to be deleted from the
  `pkg`'s user-cache pins board. A character scalar.

## Value

`id`, invisibly.

## Details

Note that it normally won't be necessary to delete a cached object using
this function because
[`cache_obj()`](https://pkgpins.rpkg.dev/dev/reference/cache_obj.md)
will always overwrite a possibly existing object in the cache with the
same `id`. If you want to ensure that no "data corpses" are left behind
from using
[`cache_obj()`](https://pkgpins.rpkg.dev/dev/reference/cache_obj.md),
consider
[clearing](https://pkgpins.rpkg.dev/dev/reference/clear_cache.md) or
even [purging](https://pkgpins.rpkg.dev/dev/reference/purge_cache.md)
the whole package user-cache pins board at once.

## See also

Other object handling functions:
[`cache_obj()`](https://pkgpins.rpkg.dev/dev/reference/cache_obj.md),
[`get_obj()`](https://pkgpins.rpkg.dev/dev/reference/get_obj.md),
[`hash_fn_call()`](https://pkgpins.rpkg.dev/dev/reference/hash_fn_call.md),
[`is_cached()`](https://pkgpins.rpkg.dev/dev/reference/is_cached.md)
