# call_to_name() ####
test_that("call_to_name() is destructive as expected by default", {

  foo <- function(a, b, c) call_to_name()

  expect_identical(foo("", "ar", list("1, 77")),
                   foo("", "ar", list(1, 77)))
})

test_that("call_to_name() is non-destructive when requested", {

  foo <- function(a, b, c) call_to_name(non_destructive = TRUE)

  expect_false(identical(foo("", "ar", list("1, 77")),
                         foo("", "ar", list(1, 77))))
})

test_that("call_to_name() excludes arguments as requested", {

  foo <- function(a, b, c) call_to_name(exclude_args = c("a", "c"))

  expect_identical(foo("zip", "ar", list(1, 77)),
                   "foo_bar")
})
