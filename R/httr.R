# httr::: functions ---

# parse_media ----
parse_media <- function (x) {
  stopifnot(!is.null(x))
  parse <- function(x, sep) {
    scan(text = x, what = character(), sep = sep, quiet = TRUE,
         quote = "\"")
  }
  pieces <- str_trim(parse(tolower(x), ";"))
  types <- str_split_fixed(pieces[1], "/", 2)[1, ]
  type <- tolower(types[1])
  subtype <- tolower(types[2])
  if (length(pieces) > 1) {
    param_pieces <- lapply(pieces[-1], str_split_fixed, "=",
                           2)
    names <- vapply(param_pieces, "[", 1, FUN.VALUE = character(1))
    values <- vapply(param_pieces, "[", 2, FUN.VALUE = character(1))
    params <- stats::setNames(as.list(values), names)
  }
  else {
    params <- list()
  }
  list(complete = paste(type, "/", subtype, sep = ""), type = type,
       subtype = subtype, params = params)
}

# str_trim ----
str_trim <- function (x) {
  gsub("(^\\s+)|(\\s+$)", "", x)
}

# str_split_fixed ----
str_split_fixed <- function (string, pattern, n) {
  if (length(string) == 0)
    return(matrix(character(), nrow = 1, ncol = n))
  m <- gregexpr(pattern, string)[[1]]
  if (length(m) == 1 && m == -1) {
    res <- string
  }
  else {
    m_starts <- m
    m_ends <- m + attr(m, "match.length") - 1L
    starts <- c(1, m_ends + 1L)[seq_len(n)]
    ends <- c((m_starts - 1L)[seq_len(n - 1)], nchar(string))
    res <- lapply(string, function(x) unlist(Map(substr,
                                                 x, starts, ends, USE.NAMES = FALSE)))
  }
  mat <- matrix("", nrow = length(res), ncol = n, byrow = TRUE)
  mat[seq_along(unlist(res))] <- unlist(res)
  mat[, seq_len(n), drop = FALSE]
}
