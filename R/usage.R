# export
#show_usage(get_x(...))
# show_usage <- function(expr) {
#   op <- options("appfigr.show_usage" = TRUE)
#   on.exit(options(op))
#   return(expr)
# }

default.appfigr.show_usage <- function () {
  val <- getOption("appfigr.show_usage")
  if (is.null(val))
    val <- FALSE
  if (!is.logical(val) || is.na(val) || length(val) != 1L)
    stop("options(\"appfigr.show_usage\") not set to TRUE or FALSE")
  val
}

default.appfigr.warning_usage_rate <- function() {
  #set as NA, negative value or > 100 to ignore warnings
  val <- getOption("appfigr.warning_usage_rate")
  if (is.null(val))
    val <- 95L
  if (!is.integer(val) || length(val) != 1L)
    stop("options(\"appfigr.warning_usage_rate\") not set to integer value.\nSet to NA, negative value or > 100 to ignore warnings.")
  val
}

default.appfigr.daily_limit <- function() {
  val <- getOption("appfigr.daily_limit")
  if (is.null(val))
    val <- get_root()$usage$daily_limit
  if (!is.integer(val) || length(val) != 1L)
    stop("options(\"appfigr.daily_limit\") not set to integer value")
  val
}

show_usage <- function(daily_used = get_usage()$daily_used,
                       daily_limit = default.appfigr.daily_limit(),
                       show_usage = default.appfigr.show_usage()) {

  if (!isTRUE(show_usage))
    return()

  message(paste0("Daily API Usage : ", round(daily_used / daily_limit * 100, 2L), "% [", daily_used, "/", daily_limit, "]"))
}

warning_usage_rate <- function(daily_used = get_usage()$daily_used,
                               daily_limit = default.appfigr.daily_limit(),
                               warn_rate = default.appfigr.warning_usage_rate()) {

  #daily_limit <- default.daily_limit()

  usage_rate <- daily_used / daily_limit * 100

  if (is.na(warn_rate) || warn_rate < 0L)
    return(invisible())
  if (usage_rate >= warn_rate)
    warning(paste0("You used ", round(usage_rate, 2L), "% of your daily API calls [", daily_used, "/", daily_limit, "]"))
}

if (!is.numeric() || !is.numeric())
