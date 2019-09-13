# create_token ----
#' @export
create_token <- function(app = "myappfiguresapp",
                         consumer_key,
                         consumer_secret) {

  token <- httr::oauth1.0_token(endpoint = httr::oauth_endpoint(request = "request_token",
                                                                authorize = "authorize",
                                                                access = "access_token",
                                                                base_url = file.path(get_base_url(), "oauth")),
                                app = httr::oauth_app(appname = app,
                                                      key = consumer_key,
                                                      secret = consumer_secret), cache = FALSE)

  token_path <- file.path(home(), ".appfigures_token.rds")
  saveRDS(token, file = token_path, compress = FALSE)
  write(paste("APPFIGURES_PAT", token_path, sep = "="), file = .Renviron(), sep = "\n", append = TRUE)
  readRenviron(.Renviron())
  return(token)
}

# appfigures_pat ----
appfigures_pat <- function() {
  pat <- Sys.getenv("APPFIGURES_PAT")
  if (identical(pat, "")) {
    stop("API user token required. Create one with create_token().", call. = FALSE)
  }
  return(pat)
}

# get_token ----
get_token <- function() {
  if (is.null(.state$appfigures_token)) {
    .state$appfigures_token <- readRDS(appfigures_pat())
    if (!inherits(.state$appfigures_token, "Token1.0")) {
      stop("Object in ", appfigures_pat(), " is not a valid token.")
    }
  }

  return(.state$appfigures_token)
}
