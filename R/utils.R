# stop_for_status_2 ----
stop_for_status_2 <- function (x, task = NULL) {
  if (httr::status_code(x) < 300)
    return(invisible(x))
  call <- sys.call(-1)
  http_condition <- httr::http_condition(x, "error", task = task, call = call)
  http_condition$message <- tryCatch({
    paste0(http_condition$message,
           "\n",
           jsonlite::fromJSON(httr::content(x, as = "text", type = "application/json", encoding = "UTF-8"))$message)
  }, error = function(e) {
    http_condition$message
  })
  stop(http_condition)
}

# depth ----
depth <- function(this) ifelse(is.list(this) && !is.data.frame(this) && !identical(this, list()), 1L + max(sapply(this, depth)), 0L)

# from purrr
at_depth <- function(.x, .depth, .f, ...) {
  .f <- as.function(.f, ...)
  recurse <- function(x, depth) {
    if (depth > 1) {
      if (is.atomic(x)) {
        stop("List not deep enough", call. = FALSE)
      }
      lapply(x, recurse, depth = depth - 1)
    }
    else {
      lapply(x, .f, ...)
    }
  }
  if (.depth == 0) {
    .f(.x, ...)
  }
  else if (.depth > 0) {
    recurse(.x, .depth)
  }
  else {
    stop(".depth cannot be negative", call. = FALSE)
  }
}

# get_url ----
get_url <- function(url = NULL, query = NULL, base_url = get_base_url()) {
  httr::GET(url = paste0(base_url, url),
            config = httr::config(token = get_token()),
            query = query,
            type = "basic")
}

# bind_result ---
# bind_result <- function(l) {
#   if (depth(l) == 1L) {
#     return(dplyr::bind_rows(l))
#   } else {
#     l <- at_depth(l, depth(l) - 1L, dplyr::bind_rows)
#     bind_result(l)
#   }
# }


