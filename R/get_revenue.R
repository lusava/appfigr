# get_revenue ----
#' Get Revenue Report.
#' @export
get_revenue <- function(start_date = NULL,
                        end_date = NULL,
                        group_by = NULL,
                        #granularity = NULL,
                        products = NULL,
                        countries = NULL,
                        dataset = NULL,
                        include_inapps = NULL,
                        format = NULL,
                        output = NULL,
                        parse_as = NULL,
                        show_usage = default.appfigr.show_usage()) {

  get_(route = "revenue",
       start_date = start_date,
       end_date = end_date,
       group_by = group_by,
       #granularity = granularity,
       products = products,
       countries = countries,
       format = format,
       output = output,
       parse_as = parse_as,
       show_usage = show_usage)

}

# OPTIONS ----
route_options$revenue <- list(parameters = list(
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
  format = list(parameter = "format",
                type = "character")))
