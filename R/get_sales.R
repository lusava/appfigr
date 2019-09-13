# get_sales ----
#' Get Sales Report.
#' @export
get_sales <- function(start_date = NULL,
                      end_date = NULL,
                      group_by = NULL,
                      granularity = NULL,
                      products = NULL,
                      countries = NULL,
                      dataset = NULL,
                      include_inapps = NULL,
                      format = NULL,
                      output = NULL,
                      parse_as = NULL) {

  get_(route = "sales",
       start_date = start_date,
       end_date = end_date,
       group_by = group_by,
       granularity = granularity,
       products = products,
       countries = countries,
       dataset = dataset,
       include_inapps = include_inapps,
       format = format,
       output = output,
       parse_as = parse_as)

}


# get_regions_sales ----
#' Get Region Sales Report
#' @export
get_regions_sales <- function(start_date = NULL,
                              end_date = NULL,
                              group_by = NULL,
                              granularity = NULL,
                              products = NULL,
                              countries = NULL,
                              dataset = NULL,
                              include_inapps = NULL,
                              format = NULL,
                              output = NULL,
                              parse_as = NULL) {

  get_(route = "regions_sales",
       start_date = start_date,
       end_date = end_date,
       group_by = group_by,
       granularity = granularity,
       products = products,
       countries = countries,
       dataset = dataset,
       include_inapps = include_inapps,
       format = format,
       output = output,
       parse_as = parse_as)

}


# OPTIONS ----
route_options$sales <- list(parameters = list(
  start_date = list(parameter = "start_date",
                    type = "date"),
  end_date = list(parameter = "end_date",
                  type = "date"),
  group_by = list(parameter = "group_by",
                  type = "character",
                  multiple = TRUE,
                  sep = ",",
                  values = c("product", "country", "date", "store")),
  granularity = list(parameter = "granularity",
                     type = "character",
                     values = c("daily", "weekly", "monthly", "yearly")),
  products = list(parameter = "products",
                  type = "character",
                  multiple = TRUE,
                  sep = ","),
  countries = list(parameter = "countries",
                   type = "character",
                   multiple = TRUE,
                   sep = ";"),
  dataset = list(parameter = "dataset",
                 type = "character",
                 values = c("none", "financial")),
  include_inapps = list(parameter = "include_inapps",
                        type = "logical"),
  format = list(parameter = "format",
                type = "character")
))
