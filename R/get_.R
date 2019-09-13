# get_ ----
get_ <- function(route = NULL,
                 path = NULL,
                 output = c("parsed", "raw", "text", "http"),
                 parse_as = c("default", "data.frame"),
                 show_usage = FALSE, ...) {

  .dots <- list(...)
  output <- match.arg(output)
  parse_as <- match.arg(parse_as)
  # use native appsflyer format to parse as data.frame, i.e. using format = csv to get a data frame
  if (identical(parse_as, "data.frame"))
    .dots$format <- "csv"

  query <- check_query(route = route, path = path, query = .dots)

  res <- get_response(base = get_base_url(), route = route, path = path, query = query)

  daily_used <- as.numeric(res$headers$`x-request-usage`)
  daily_limit <- as.numeric(res$headers$`x-request-limit`)
  show_usage(daily_used = daily_used, daily_limit = daily_limit, show_usage = show_usage)
  warning_usage_rate(daily_used = daily_used, daily_limit = daily_limit)

  if (identical(output, "parsed")) {
    res <- parse_content(res, content_type = query$format)
  } else if (output %in% c("raw", "text")) {
    res <- httr::content(res, as = output)
  }

  return(res)
}
