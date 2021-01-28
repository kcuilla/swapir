#' Returns the top sites that are most similar to the given website
#'
#' The `get_similar_sites()` function returns the top sites that are most similar to the given website within the past 28 days.
#'
#' @param api_key API key is required.
#' Please set API key equal to similarweb_api_key before calling function.
#' If you do not have an API key, you can get an API key at https://account.similarweb.com/#/api-management2
#' Note: You must have a subscription to SimilarWeb's services.
#'
#' @param site Website name is required. Do not include 'www' or 'https' before website. Ex. 'google.com'
#'
#' @param md Default is set to 'False' but can be set to 'True' for main domain only
#'
#' @return tibble with site url and similarity score columns
#'
#' @export
#'
#' @examples
#' ##top_similar_sites <- get_similar_sites(site = "bbc.com")

get_similar_sites <- function(api_key = similarweb_api_key, site, md = "False") {
  request = paste0("https://api.similarweb.com/v1/website/", site,
                   "/similar-sites/similarsites?api_key=", api_key,
                   "&main_domain_only=", md)

  result <- httr::GET(request)

  if (result$status_code == 200){
    text <- httr::content(result,as = "text", encoding = "UTF-8")
    json <- jsonlite::fromJSON(text)
    results <- dplyr::as_tibble(json$similar_sites)
  }
  results
}
