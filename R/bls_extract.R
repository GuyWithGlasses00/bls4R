#' Extracts data from BLS request
#'
#' This function extracts data from the BLS API request and returns it as a `data.table::data.table()`
#'
#' @author Issaac Hansen
#' @param request the data element of the BLS API request from the `bls_request()` function
#' @returns A `data.table::data.table()` containing 3 columns: `year`, `month`, `index`.
#' @export
#'
bls_extract <- function(
    request
){
  # Get number of rows in the data element
  n <- base::length(request)

  # Loop through all rows in the data object and unpack the values
  data <- base::sequence(n) |>
    base::lapply(function(i) bls_unpacker(request[[i]]))

  # Format the data as a data.table
  data <- data |> data.table::rbindlist()
  data.table::setnames(data, new = c("year", "month", "index"))

  # Return data
  return(data)
}
