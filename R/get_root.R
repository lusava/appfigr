# get_root ----
#
#' @export
get_root <- function(output = NULL) {
  get_(route = "root", output = output)
}

#' @export
get_api_version <- function() {
  get_root()$version
}

#' @export
get_user_infos <- function() {
  get_root()$user
}

#' @export
get_accessible_features <- function() {
  unlist(get_root()$accessible_features)
}

#' @export
get_status <- function() {
  return(as.integer(get_root()$status))
}

#' @export
check_api <- function() {
  status <- get_status()
  message(httr::http_condition(status, type = "warning"))
  return(invisible(status))
}

#' @export
see_documentation <- function() {
  browseURL(get_root()$see)
}

#' @export
get_usage <- function() {
  return(get_root()$usage)
}

#' @export
get_daily_usage_rate <- function(quiet = FALSE){
  usage_rate <- with(get_usage(), daily_used / daily_limit)
  if (!quiet)
    message(paste0(round(usage_rate * 100, 2L), "%"))
  return(invisible(usage_rate))
}

#' @export
get_sequence <- function() {
  return(get_root()$sequence)
}

#' @export
get_source <- function() {
  return(get_root()$source)
}
