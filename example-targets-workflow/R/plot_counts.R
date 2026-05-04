plot_counts <- function(counts, key) {
  ggplot(counts, aes(mean_temperature_c_yearly, chicks_avg)) +
    geom_point() +
    geom_smooth(method = 'lm') +
    ggtitle(key)
}