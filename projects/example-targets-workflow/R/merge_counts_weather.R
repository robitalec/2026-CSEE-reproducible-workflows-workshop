merge_counts_weather <- function(counts, weather) {
  # Check input
  stopifnot(is.data.frame(counts))
  stopifnot(is.data.frame(weather))

  # Clean column names, extract year + month, join with weather
  prep_counts <- counts %>%
    clean_names() %>%
    mutate(year = year(as.Date(date)), month = month(as.Date(date)))

  # Clean column names and extract year + month
  prep_weather <- weather %>%
    clean_names() %>%
    mutate(year = year(as.Date(date)), month = month(as.Date(date)))

  inner_join(
    prep_counts,
    prep_weather,
    by = c('year', 'month'),
    suffix = c('_counts', '_weather')
  )
}
