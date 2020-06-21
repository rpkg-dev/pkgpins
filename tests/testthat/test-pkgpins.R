# call_to_name() ####
test_that("call_to_name() is destructive as expected by default", {

  foo <- function(a, b, c) call_to_name()

  expect_identical(foo(4 - 2, 'a \" r', list("1, 77")),
                   foo(1+1, 'ar', list('1,77')))
})

test_that("call_to_name() is non-destructive when requested", {

  foo <- function(a, b, c) call_to_name(non_destructive = TRUE)

  expect_identical(foo(4 - 2, "a \" r", list("1, 77")),
                   foo(1+1, 'a " r', list('1, 77')))
})

test_that("call_to_name() excludes arguments as requested", {

  foo <- function(a, b, c) call_to_name(exclude_args = c("a", "c"))

  expect_identical(foo(1+1, 'ar', list(1, 77)),
                   "foo-b='ar'")
})

test_that("call_to_name() doesn't sanitize when requested", {

  foo <- function(a, b, c) call_to_name(sanitize = FALSE)

  expect_identical(foo(1 + 1, 'a   r', list("1, 77")),
                   "foo-a=2,b=\"ar\",c=list(\"1,77\")")
})

test_that("call_to_name() doesn't remove blanks when requested", {

  foo <- function(a, b, c) call_to_name(rm_blanks = FALSE)

  expect_identical(foo(1 + 1, "a   r", list("1, 77")),
                   "foo-a = 2, b = 'a   r', c = list('1, 77')")
})

test_that("call_to_name() adds the namespace by default", {

  skip_if_not_installed(pkg = "pkgpins")

  expect_identical(pkgpins:::test_call_to_name(),
                   "pkgpins-test_call_to_name")
})

test_that("call_to_name() doesn't add the namespace when requested", {

  skip_if_not_installed(pkg = "pkgpins")

  expect_identical(pkgpins:::test_call_to_name_no_ns(),
                   "test_call_to_name_no_ns")
})
