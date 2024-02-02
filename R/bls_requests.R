#' Request BLS indices
#'
#' This function returns a number of specified series from the BLS as a
#' `data.table::data.table()` with `year`, `month`, `index`, and `series_id`.
#'
#' @author Issaac Hansen
#' @param series `base::vector`; a vector of series id's corresponding with the BLS coding
#' @param start_year `base::integer`; the starting year (inclusive) to return BLS indices for
#' @param end_year `base::integer`; the ending year (inclusive) to return BLS indices for
#' @param url_ `base::character`; the url for the BLS api
#' @returns A `data.table::data.table()` containing 4 columns: `year`, `month`, `index`, and `series_id`
#' @export
#'
bls_requests <- function(
    series
    ,start_year
    ,end_year
    ,url_ = BLS$url
){
  # Number of series to loop through
  n <- base::length(series)

  # Build API queries
  queries <- series |>
    base::lapply(function(x) bls4R::bls_query(series=x, start_year=start_year, end_year=end_year, url_=url_))

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
