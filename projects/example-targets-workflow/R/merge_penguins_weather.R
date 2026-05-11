merge_penguins_weather <- function(penguins, weather) {
  # Check input
  stopifnot(is.data.frame(penguins))
  stopifnot(is.data.frame(weather))

  # Clean column names, extract year + month, join with weather
  prep_penguins <- penguins %>%
    clean_names() %>%
    mutate(
      year = year(as.Date(date_egg)),
      month = month(as.Date(date_egg))
    )

  # Clean column names and extract year + month
  prep_weather <- weather %>%
    clean_names() %>%
    mutate(
      year = year(as.Date(date)),
      month = month(as.Date(date))
    )

  inner_join(
    prep_penguins,
    prep_weather,
    by = c("year", "month"),
    suffix = c("_penguin", "_weather")
  )
}
