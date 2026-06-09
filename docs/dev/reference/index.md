# Package index

## High-level functions

- [`with_cache()`](https://pkgpins.rpkg.dev/dev/reference/with_cache.md)
  : Cache the result of an expression
- [`cachely()`](https://pkgpins.rpkg.dev/dev/reference/cachely.md) : Add
  caching to a function

## Low-level functions

### Manage package cache

Functions to manage package user-cache pins board(s).

- [`board()`](https://pkgpins.rpkg.dev/dev/reference/board.md) : Get a
  package's user-cache pins board
- [`path_cache()`](https://pkgpins.rpkg.dev/dev/reference/path_cache.md)
  : Get a package's user-cache pins board path
- [`ls_cache()`](https://pkgpins.rpkg.dev/dev/reference/ls_cache.md) :
  List all objects in a package's user-cache pins board
- [`clear_cache()`](https://pkgpins.rpkg.dev/dev/reference/clear_cache.md)
  : Clear a package's user-cache pins board
- [`purge_cache()`](https://pkgpins.rpkg.dev/dev/reference/purge_cache.md)
  : Purge a package's user-cache pins board
- [`purge_caches()`](https://pkgpins.rpkg.dev/dev/reference/purge_caches.md)
  : Purge all package user-cache pins boards

### Handle objects

Functions to cache/retrieve/delete results of a function call.

- [`hash_fn_call()`](https://pkgpins.rpkg.dev/dev/reference/hash_fn_call.md)
  : Hash a function call
- [`is_cached()`](https://pkgpins.rpkg.dev/dev/reference/is_cached.md) :
  Test whether an object exists in a package's user-cache pins board
- [`cache_obj()`](https://pkgpins.rpkg.dev/dev/reference/cache_obj.md) :
  Cache an object to a package's user-cache pins board
- [`get_obj()`](https://pkgpins.rpkg.dev/dev/reference/get_obj.md) : Get
  a cached object from a package's user-cache pins board
- [`rm_obj()`](https://pkgpins.rpkg.dev/dev/reference/rm_obj.md) :
  Delete a cached object from a package's user-cache pins board
