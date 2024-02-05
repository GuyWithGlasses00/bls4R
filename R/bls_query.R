#' Build BLS API request
#'
#' This function returns a formatted url to send an API request
#' to the BLS website.
#'
#' @author Issaac Hansen
#' @param BLS `bls4R::BLS`; initialized with API key
#' @param series `base::character`; the series id corresponding with the BLS coding
#' @param start_year `base::integer`; the starting year (inclusive) to return BLS indices for
#' @param end_year `base::integer`; the ending year (inclusive) to return BLS indices for
#' @returns A `data.table::data.table()` containing 3 columns: `year`, `month`, and `index`
#' @export
#'
bls_query <- function(
    BLS
    ,series
    ,start_year
    ,end_year
){
  # Create API query
  query <- base::paste0(BLS$url, series, "?registrationkey=", BLS$key, "&startyear=", start_year, "&endyear=", end_year)

  # Return query
  return(query)
}
