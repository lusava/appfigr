.onLoad <- function(libname, pkgname) {

  root <- get_root()

  op.appfigr <- list(appfigr.show_usage = FALSE,
                     appfigr.warning_usage_rate = 95L,
                     appfigr.daily_limit = root$usage$daily_limit)

  toset <- !(names(op.appfigr) %in% names(options()))
  if (any(toset)) options(op.appfigr[toset])

  assign("root", root, envir = parent.env(environment()))

  invisible()
}

.onAttach <- function(libname, pkgname) {
  #packageStartupMessage("Hello")
}
