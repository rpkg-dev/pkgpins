% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pkgpins.gen.R
\name{clear_cache}
\alias{clear_cache}
\title{Clear a package's user-cache pins board}
\usage{
clear_cache(board, max_age = "1 day")
}
\arguments{
\item{board}{\link[=board]{Package's user-cache pins board}.}

\item{max_age}{Age above which cached objects will be deleted. A valid \link[lubridate:as.duration]{lubridate duration}. Defaults to 1 day (24 hours).}
}
\value{
\code{board}, invisibly.
}
\description{
Deletes all objects from a package's user-cache pins board that exceed a certain \code{max_age}. If \code{board} is \code{pkg_versioned}, additionally deletes all
user-cache pins boards belonging to versions of the package other than the currently installed one.
}
\details{
This function could be called on package load/unload, for example.
}
\examples{
\dontrun{
# delete all cached results that are older than 7 days at once on package load:
.onLoad <- function(libname, pkgname) {
  pkgpins::clear_cache(board = pkgpins::board(pkg = pkgname),
                       max_age = "7 days")
}}
}
\seealso{
Other package cache management functions:
\code{\link{board}()},
\code{\link{ls_cache}()},
\code{\link{path_cache}()},
\code{\link{purge_cache}()},
\code{\link{purge_caches}()}
}
\concept{pkg_cache_mgmt}
