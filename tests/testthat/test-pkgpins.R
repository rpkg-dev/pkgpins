# call_to_hash() ----

test_that("hash_fn_call() properly evaluates the call's arguments", {

  foo <- function(a, b, c) hash_fn_call(from_fn = "foo")

  expect_identical(foo(1 + 1, 'ar', list(1, 77)),
                   foo(3 - 1, paste0("a", "r"), list(a = 1, 77) %>% rlang::set_names(nm = NULL)))
})
