#parse_content ----
parse_content <- function(res,
                          content_type = c("auto", "csv", "json")) {

  content_type <- match.arg(content_type)

  if (identical(content_type, "auto")) {
    content_type <- httr:::parse_media(res$headers[["Content-Type"]])$subtype
    #content_type <- parse_media(res$headers[["Content-Type"]])$subtype
  }

  parse_fun <- switch(content_type,
                      csv = function(x, encoding) {
                        #if (!identical(system.file(package = "readr"), "")) {
                          #readr::read_csv(x, locale = readr::locale(encoding = encoding))
                        #} else
                        read.csv(text = readBin(x, character()), header = TRUE)
                      },
                      json = function(x, encoding) {
                        jsonlite::fromJSON(iconv(readBin(x, character()), from = encoding, to = "UTF-8"), simplifyVector = FALSE)
                      },
                      NULL)

  if (is.null(parse_fun)) {
    stop("No parsing function implemented for type \"", content_type, "\"", call. = FALSE)
  }

  tryCatch(
    res <- parse_fun(x = res$content, encoding = "UTF-8"),
    error = function(e) {
      stop("Fail to parse response content", call. = FALSE)
    }
  )

  return(res)
}



