avg_colony_size <- function(full_datasets, filter_years){

  count_avgs <- full_datasets[['counts']] %>%
    group_by(island, year) %>%
    filter(year %in% filter_years) %>%
    summarize(adults_avg = mean(adults, na.rm = T),
              chicks_avg = mean(chicks, na.rm = T),
              mean_temperature_c_yearly = mean(mean_temperature_c, na.rm = T))

  size_avgs <- full_datasets[['penguins']] %>%
    group_by(island, sex, year) %>%
    filter(year %in% filter_years) %>%
    summarize(body_mass_g_avg = mean(body_mass_g, na.rm = T),
              flipper_length_mm_avg = mean(flipper_length_mm, na.rm = T),
              mean_precipitation_mm_yearly = mean(mean_precipitation_mm, na.rm = T))


  avgs <- list(count_avgs, size_avgs)

  names(avgs) <- names(full_datasets)

  return(avgs)

}