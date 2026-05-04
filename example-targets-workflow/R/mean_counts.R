mean_counts <- function(counts, filter_years){
  counts %>%
    group_by(island, year) %>%
    filter(year %in% filter_years) %>%
    summarize(adults_avg = mean(adults, na.rm = T),
              chicks_avg = mean(chicks, na.rm = T),
              mean_temperature_c_yearly = mean(mean_temperature_c, na.rm = T)) |>
    ungroup()
}