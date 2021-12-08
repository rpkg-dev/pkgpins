# call_to_hash() ----

test_that("hash_fn_call() properly evaluates the call's arguments", {

  foo <- function(a, b, c) hash_fn_call(from_fn = "foo")
  hashed <- "foo-780e938ebcc489f7182e21d895d7eae9"

  expect_identical(foo(1 + 1, 'ar', list(1, 77)),
                   hashed)

  expect_identical(foo(3 - 1, paste0("a", "r"), list(a = 1, 77) %>% rlang::set_names(nm = NULL)),
                   hashed)
})
