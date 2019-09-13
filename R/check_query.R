# check_query ----
check_query <- function(route, path = NULL, query = NULL) {

  if (identical(length(query), 0L))
    return(NULL)

  query_options <- route_options[[route]]$parameters

  if (is.null(query_options))
    return(query)

  if (!all(names(query_options) %in% names(query)))
    warning("[DEV] arguments defined in ", route, " options but not in the get function", call. = FALSE)

  query <- clean_query(query)

  if (is.null(query))
    return(NULL)

  check_arg <- function(arg) {

    name <- names(arg)
    value <- arg[[1L]]
    if (is.numeric(value))
      value <- format(value, scientific = FALSE)
    value <- tolower(as.character(value))
    arg_options <- query_options[[name]]

    if (is.null(arg_options)) {
      warning("[DEV] ", name, " not defined in ", route, " options", call. = FALSE)
      return(list(name = name,
                  value = value))
    }

    multiple <- isTRUE(arg_options$multiple)

    if (!multiple && length(value) != 1L)
      stop(name, " must be of length 1", call. = FALSE)

    values <- arg_options$values

    if (!is.null(values) && !all(value %in% values))
      #match.arg(value, values, several.ok = multiple)
      stop(name, " value(s) should be in ", paste0("\"", values, "\"", collapse = ", "), call. = FALSE)

    if (multiple)
      value <- paste(value, collapse = arg_options$sep)

    return(list(name = arg_options$parameter,
                value = value))

  }

  for (i in seq_along(query)) {
    arg <- check_arg(query[i])
    query[i] <- as.list(setNames(arg$value, arg$name))
  }

  if (identical(length(query), 0L))
    return(NULL)

  #message(paste0("Query :\n", paste0(names(query), ": ", query, collapse = "\n")))
  query
}

# clean_query ----
clean_query <- function(x) {

  is_empty <- function(x) identical(length(x), 0L)

  if (is_empty(x))
    return(NULL)

  x <- x[sapply(x, is.atomic)]
  x <- mapply(`[`,
              x = x,
              i = lapply(x, function(x) if(is_empty(x)) FALSE else as.character(x) != "" & !is.na(x)),
              SIMPLIFY = FALSE)
  x <- x[!sapply(x, function(x) is_empty(x))]

  if (is_empty(x))
    return(NULL)
  x
}
