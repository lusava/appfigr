# get_base_url ----
get_base_url <- function() {
  return("https://api.appfigures.com/v2")
}

# get_route ----
get_route <- function(route) {
  switch(route,
         root = "/",
         products = "/products",
         my_products = "/products/mine",
         sales = "/reports/sales",
         regions_sales = "/reports/sales/regions",
         revenue = "/reports/revenue",
         #subscriptions = "/reports/subscriptions",
         ads = "/reports/ads",
         #adspend = "/reports/adspend",
         #ratings = "/reports/ratings",
         #ranks = "/ranks",
         #featured = "/featured",
         #reviews = "/reviews",
         #events = "/events",
         #archive = "/archive",
         #users = "/users",
         #exertnal_accounts = "/external_accounts",
         #data = "/data",
         #usage = "/usage"
  )
}

# build_url ----
build_url <- function(base, route, path = NULL, query = NULL) {

  route <- get_route(route)

  if (!is.null(path))
    path <- paste0("/", paste(path, collapse = "/"))

  parsed_url <- httr::parse_url(paste0(base, route, path))

  parsed_url$query <- query

  return(httr::build_url(parsed_url))
}
