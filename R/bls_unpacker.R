#' Unpacks a row from the BLS request list
#'
#' This function extracts a row of from the list returned from `bls_request()`
#' and returns it as a `base::vector()` with the `year`, `month`, and `index`.
#'
#' @author Issaac Hansen
#' @param x a row from the list returned by `bls_request()` function
#' @returns A `data.table::data.table()` containing 3 columns: `year`, `month`, `index`.
#'
bls_unpacker <- function(
    x
){
  # Extract elements from row
  row_ <- list(x[["year"]], x[["periodName"]], x[["value"]])

  # Return row
  return(row_)
}
