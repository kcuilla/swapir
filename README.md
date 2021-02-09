# swapir <img src="man/swapir_hex.png" align="right" />

<!-- badges: start -->
<!-- badges: end -->

The {swapir} package is a tidy API wrapper for the SimilarWeb API. With {swapir}, you can retrieve web analytics metrics from a given site such as number of visits, visit duration, visitor demographic info, and more. 

## Installation

You can install the swapir package from GitHub with:

```{r}
remotes::install_github("kcuilla/swapir")
library(swapir)
```

## Examples

In order to use the API, you first must have an account and subscription to use [SimilarWeb](https://www.similarweb.com/). If you already have a subscription, you'll need to find your API key in the Account section under [API Management](https://account.similarweb.com/#/api-management2). Once you have your API key, you'll need to assign it to a variable called similarweb_api_key as shown below:  

```{r}
similarweb_api_key = "xxxxx" # replace xxxxx with your API key 
```

### get_visits()

Retrieve the number of visits for a given site. The default granularity is monthly, but can set to daily or weekly with the `gr` argument.

```{r}
get_visits(site = "bbc.com", start = "2020-10", end = "2020-12")
```

```{r}
  date          visits
  <chr>         <dbl>
1 2020-10-01	171.3330			
2 2020-11-01	175.0670			
3 2020-12-01	181.7172	
```

### get_unique_visitors()

Retrieve the number of unique visitors for a given site.

```{r}
get_unique_visitors(site = "bbc.com", start = "2020-10", end = "2020-12")
```

```{r}
  date          unique_visitors
  <chr>         <dbl>
1 2020-10-01	11895769			
2 2020-11-01	14259712			
3 2020-12-01	10273279	
```

### get_visit_duration()

Retrieve the average visit duration for a given site (results displayed in seconds).

```{r}
get_visit_duration(site = "bbc.com", start = "2020-10", end = "2020-12")
```

```{r}
  date          average_visit_duration
  <chr>         <dbl>
1 2020-10-01	171.3330			
2 2020-11-01	175.0670			
3 2020-12-01	181.7172	
```

### get_bounce_rate()

Retrieve the bounce rate for a given site (results displayed in seconds).

```{r}
get_bounce_rate(site = "bbc.com", start = "2020-10", end = "2020-12")
```

```{r}
  date          bounce_rate
  <chr>         <dbl>
1 2020-10-01	0.6118030			
2 2020-11-01	0.6187706			
3 2020-12-01	0.6000651	
```

### get_gender_demographic()

Retrieve the percentage of male/female visitors for a given site.

```{r}
get_gender_demographic(site = "bbc.com", start = "2020-10", end = "2020-12")
```

```{r}
  gender        value
  <chr>         <dbl>
1 Male	        0.6084058			
2 Female        0.3915942				
```

### get_age_demographic()

Retrieve the age distribution for a given site.

```{r}
get_age_demographic(site = "bbc.com", start = "2020-10", end = "2020-12")
```

```{r}
  age               value
  <chr>             <dbl>
1 18 to 24	    0.1920524			
2 25 to 34	    0.2498818	
3 35 to 44	    0.1849099		
4 45 to 54	    0.1502282	
5 54 to 64          0.1254753			
6 65+   	    0.0974524	
```

### get_similar_sites()

Retrieve the top most similar websites to the given site and their similarity scores.

```{r}
get_similar_sites(site = "bbc.com")
```

```{r}
  url               score
  <chr>             <dbl>
1 abcnews.go.com    0.7802319			
2 time.com	    0.7640233	
3 express.co.uk	    0.7477546		
4 latimes.com	    0.7475793	
5 mirror.co.uk	    0.7444694			
6 msn.com     	    0.7326087	
7 theverge.com	    0.7308741			
8 cnbc.com	    0.7305856	
9 theatlantic.com   0.7126669			
10 vox.com     	    0.7108954	
```
