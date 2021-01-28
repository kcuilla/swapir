#' Returns the age distribution of visitors by month for a given website
#'
#' The `get_age_demographic()` function returns the age distribution of visitors to a given website based on the start and end date you provide.
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
#' @param country Country set to 'US' as default but can be set to another 2-letter ISO country code depending on your level of access within SimilarWeb.
#'
#' @param md Default is set to 'False' but can be set to 'True' for main domain only
#'
#' @return tibble with age and value columns
#'
#' @export
#'
#' @examples
#' ##age_demographic <- get_age_demographic(site = "bbc.com", start = "2020-10", end = "2020-12")

get_age_demographic <- function(api_key = similarweb_api_key, site, start, end, country = "us", md = "False") {
  request = paste0("https://api.similarweb.com/v1/website/", site,
                   "/demographics/age?api_key=", api_key,
                   "&start_date=", start,
                   "&end_date=", end,
                   "&country=", country,
                   "&main_domain_only=", md)

  result <- httr::GET(request)

  if (result$status_code == 200){
    text <- httr::content(result,as = "text", encoding = "UTF-8")
    json <- jsonlite::fromJSON(text)
    age_18_to_24 <- dplyr::as_tibble(json$age_18_to_24) %>% dplyr::mutate(age = "18 to 24")
    age_25_to_34 <- dplyr::as_tibble(json$age_25_to_34) %>% dplyr::mutate(age = "25 to 34")
    age_35_to_44 <- dplyr::as_tibble(json$age_35_to_44) %>% dplyr::mutate(age = "35 to 44")
    age_45_to_54 <- dplyr::as_tibble(json$age_45_to_54) %>% dplyr::mutate(age = "45 to 54")
    age_55_to_64 <- dplyr::as_tibble(json$age_55_to_64) %>% dplyr::mutate(age = "55 to 64")
    age_65_plus <- dplyr::as_tibble(json$age_65_plus) %>% dplyr::mutate(age = "65+")
    results <- rbind(age_18_to_24,age_25_to_34,age_35_to_44,age_45_to_54,age_55_to_64,age_65_plus)
  }
  results
}
