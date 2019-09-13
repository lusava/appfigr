# get_ads ----
#' Get Ads Report.
#' @export
get_ads <- function(start_date = NULL,
                    end_date = NULL,
                    group_by = NULL,
                    granularity = NULL,
                    products = NULL,
                    countries = NULL,
                    networks = NULL,
                    format = NULL,
                    output = NULL,
                    parse_as = NULL) {

  get_(which = "ads",
       start_date = start_date,
       end_date = end_date,
       group_by = group_by,
       granularity = granularity,
       products = products,
       countries = countries,
       networks = networks,
       format = format,
       output = output,
       parse_as = parse_as)

}
