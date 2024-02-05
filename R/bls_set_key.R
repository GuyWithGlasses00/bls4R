#' Set API key for BLS.
#'
#' This function sets the API key in the BLS object to interact with the API.
#'
#' @author Issaac Hansen
#' @param BLS `bls4R::BLS` object containing URL and API key
#' @param key `base::character` object which sets API key in `BLS` object
#' @export
#'
bls_set_key <- function(
    BLS
    ,key
){
  # Set `key` item in `BLS` object
  BLS$key <- key

  # Return BLS
  return(BLS)
}
