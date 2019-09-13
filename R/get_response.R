# get_response ----
get_response <- function(base = NULL, route = NULL, path = NULL, query = NULL) {

  url <- build_url(base = base, path = path, route = route)

  token <- get_token()

  res <- httr::GET(url = url,
                   config = httr::config(token = token),
                   query = query,
                   type = "basic")

  stop_for_status_2(res)
  return(res)
}
