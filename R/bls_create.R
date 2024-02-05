#' Initializes new BLS object.
#'
#' This function creates a BLS object to interact with the BLS functions.
#'
#' @author Issaac Hansen
#' @param BLS `bls4R::BLS` object containing URL and API key
#' @param key `base::character` object which sets API key in `BLS` object
#' @export
#' @examples
#' # Create default BLS object
#' BLS <- bls4R::bls_create()
#'
#' # Set API key
#' BLS <- bls4R::bls_set_key(BLS=BLS,key="YOUR_API_KEY")
#'
#' # Or, do it all in one call!
#' BLS <- bls4R::bls_create(key="YOUR_API_KEY")
#'
bls_create <- function(
    key = NA
){
  # Initialize BLS object
  BLS <- bls4R::BLS

  # Set API key
  BLS$key <- key

  # Return BLS object
  return(BLS)
}
