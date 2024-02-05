#' Request BLS indices
#'
#' This function returns a number of specified series from the BLS as a
#' `data.table::data.table()` with `year`, `month`, `index`, and `series_id`.
#'
#' @author Issaac Hansen
#' @param BLS `bls4R::BLS`; BLS object containing API key
#' @param series `base::vector`; a vector of series id's corresponding with the BLS coding
#' @param start_year `base::integer`; the starting year (inclusive) to return BLS indices for
#' @param end_year `base::integer`; the ending year (inclusive) to return BLS indices for
#' @returns A `data.table::data.table()` containing 4 columns: `year`, `month`, `index`, and `series_id`
#' @export
#' @examples
#' # Initialize BLS Object
#' BLS <- bls4R::bls_create()
#' # Set API key
#' BLS <- bls4R::bls_set_key(key="YOUR_API_KEY")
#' # Send request to BLS
#' data <- bls4R::bls_requests(BLS=BLS,series="BLS_SERIES_ID",start_year=2000,end_year=2023)
#'
bls_requests <- function(
    BLS
    ,series
    ,start_year
    ,end_year
){
  # Number of series to loop through
  n <- base::length(series)

  # Build API queries
  queries <- series |>
    base::lapply(function(x) bls4R::bls_query(series=x, start_year=start_year, end_year=end_year, BLS=BLS))

  # Send request for each series
  requests <- queries |>
    base::lapply(function(query) bls4R::bls_request(query=query))

  # Extract data for each request
  data <- base::sequence(n) |>
    base::lapply(function(i) {
      data_ <- bls4R::bls_extract(request=requests[[i]]) |>
        data.table::set(j = "series_id", value = series[i])
      })

  # Bind data.table into a single data.table
  data <- data |> data.table::rbindlist()

  # Return all series
  return(data)
}
