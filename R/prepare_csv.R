prepare_csv <- function(counts_raw, weather_raw, penguin_raw) {

  stopifnot(sapply(list(counts_raw, weather_raw, penguin_raw), is.data.frame))

  # clean column names and extract year + month
  weather <- weather_raw %>%
    clean_names() %>%
    mutate(year = format(as.Date(date, format="%Y-%m-%d"),"%Y"),
           month = format(as.Date(date, format="%Y-%m-%d"),"%m"))

  # clean column names, extract year + month, join with weather
  counts <- counts_raw %>%
    clean_names() %>%
    mutate(year = format(as.Date(date, format="%Y-%m-%d"),"%Y"),
           month = format(as.Date(date, format="%Y-%m-%d"),"%m")) %>%
    inner_join(., weather, by = c('year', 'month'))

  penguin <- penguin_raw %>%
    clean_names() %>%
    mutate(year = format(as.Date(date_egg, format="%Y-%m-%d"),"%Y"),
           month = format(as.Date(date_egg, format="%Y-%m-%d"),"%m")) %>%
    inner_join(., weather, by = c('year', 'month'))


  dfs <- list(counts, penguin) %>%
    setNames(., c('counts', 'penguins'))


  stopifnot(sapply(dfs, is.data.frame))


  return(dfs)
}