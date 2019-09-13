# get_products <- function(output = NULL) {
#
#   get_(route = "products", output = output)
#
# }
#
# products <- new.env(parent = emptyenv())
#
# products$products <- get_products()
#
# products$products_df <- do.call(rbind.data.frame, lapply(lapply(products, function(x) x[c("id", "name", "store", "bundle_identifier", "parent_id", "type")]), function(x) data.frame(lapply(x, function(y) if (is.null(y)) NA else y))))
#
# products$apps <- products_df[products_df$type == "app", !(names(products_df) %in% c("parent_id", "type"))]
#
# products$iaps <- products_df[products_df$type == "inapp", !(names(products_df) %in% c("bundle_identifier", "type"))]
#
#
# get_product <- function(id) {
#
#   if (!(is.atomic(id) && identical(length(id), 1L)))
#     stop()
#
#   if (is.na(suppressWarnings(as.integer(id))))
#     stop("id should be an integer", call. = FALSE)
#
#   id <- format(id, scientific = FALSE)
#
#   if (!(id %in% names(products$products)))
#     stop(id, " is not part of your products", call. = FALSE)
#
#   products$products[[id]]
#
# }
#
# list_my_products <- function() {
#
# }
#
# list_my_apps <- function() {
#
# }
#
#
# httr::content(appfigr:::get_url("/products/280506563136,280466650393"))
#
#
# refresh_products <- function()
#
# # appfigr:::get_url("/products/apple/335060889")
# #
# #
# # /products/mine?store=apple
# #
# #
# # mtf <- httr::content(appfigr:::get_url("/products/280506563136"))
# #
# # appfigr:::get_url("/products/google_play/eu.bandainamcoent.mytamagotchiforever")
# # appfigr:::get_url("/products/280466650393")
# # appfigr:::get_url("/products/apple/1267861706") #vendor_identifier
# #
# # httr::content(appfigr:::get_url("/products/280506563136+280466650393"))
# #
# #
# #
# #
# # httr::content(appfigr:::get_url("/products/search/fob+finder"))
# # /products/search/{term}?filter={filter}&page={page}&count={count}
# #
# #
# # $parent_id
# # $children list()
# #
# # products <- httr::content(appfigr:::get_url("/products/mine"))
# #
# #
# #
# # x <- microbenchmark::microbenchmark(
# #   `if` = do.call(rbind.data.frame, lapply(l, function(x) data.frame(lapply(x, function(y) if (is.null(y)) NA else y)))),
# #   ifelse = do.call(rbind.data.frame, lapply(l, function(x) data.frame(lapply(x, function(y) ifelse(is.null(y), NA, y))))),
# #   times = 50L
# # )
# #
# #
# #
# # do.call(rbind.data.frame,
# #         lapply(products[sapply(products, `[[`, "type") == "app"],
# #                function(x) data.frame(x[c("id", "name", "store", "bundle_identifier")], stringsAsFactors = FALSE)))
# #
