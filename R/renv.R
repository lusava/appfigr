# from rtweet package
home <- function() {
  if (!identical(Sys.getenv("HOME"), "")) {
    file.path(Sys.getenv("HOME"))
  } else {
    file.path(normalizePath("~"))
  }
}

# from rtweet package
.Renviron <- function() {
  if (file.exists(".Renviron")) {
    ".Renviron"
  } else {
    file.path(home(), ".Renviron")
  }
}
