# get_products <- function(id, output = NULL) {
#
#   if (!(is.atomic(id) && identical(length(id), 1L)) || is.na(suppressWarnings(as.integer(id))))
#     stop("id should be a length one integer vector", call. = FALSE)
#
#   get_(route = paste("products", format(id, scientific = FALSE), sep = "/"), output = output)
#
# }
get_products <- function(id, output = NULL) {

  if (!(is.atomic(id) && identical(length(id), 1L)) || is.na(suppressWarnings(as.integer(id))))
    stop("id should be a length one integer vector", call. = FALSE)

  get_(route = "products", path = id, output = output)

}

#error 403 (permission) "This resource requires Partner API Access. Reason: Some given products are not owned by your account. (the first one is.
#error 400 parameter product is not valid. expected int got: eu.bandainamcoent.mytamagotchiforever


search_products <- function(output = NULL) {

  get_(route = "search_products", output = output)

}

#get_my_products ----
#' Get My Products.
#' @export
get_my_products <- function(output = NULL) {

  get_(route = "products", path = "mine", output = output)

}
