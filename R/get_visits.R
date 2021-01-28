#' Returns number of monthly visits for a given website
#'
#' The `get_visits()` function returns the number of monthly visits for a given website based on the start and end date you provide.
#'
#' @param api_key API key is required.
#' Please set API key equal to similarweb_api_key before calling function.
#' If you do not have an API key, you can get an API key at https://account.similarweb.com/#/api-management2
#' Note: You must have a subscription to SimilarWeb's services.
#'
#' @param site Website name is required. Do not include 'www' or 'https' before website. Ex. 'google.com'
#'
#' @param start Start date required in YYYY-MM format. Ex. '2020-10'
#'
#' @param end End date required in YYYY-MM format. Ex. '2020-12'
#'
#' @param gr Granularity set to 'monthly' as default but can be set to 'daily' or 'weekly'
#'
#' @param country Country set to 'US' as default but can be set to another 2-letter ISO country code depending on your level of access within SimilarWeb.
#'
#' @param md Default is set to 'False' but can be set to 'True' for main domain only
#'
#' @return tibble with date and visit columns
#'
#' @export
#'
#' @examples
#' ##site_visits <- get_visits(site = "bbc.com", start = "2020-10", end = "2020-12")

get_visits <- function(api_key = similarweb_api_key, site, start, end, gr = "monthly", country = "us", md = "False") {

    request = paste0("https://api.similarweb.com/v1/website/", site,
                   "/total-traffic-and-engagement/visits?api_key=", api_key,
                   "&start_date=", start,
                   "&end_date=", end,
                   "&country=", country,
                   "&main_domain_only=", md,
                   "&granularity=", gr)

  result <- httr::GET(request)

  if (result$status_code == 200){
    text <- httr::content(result,as = "text", encoding = "UTF-8")
    json <- jsonlite::fromJSON(text)
    results <- dplyr::as_tibble(json$visits)
  }
  return(results)
}
