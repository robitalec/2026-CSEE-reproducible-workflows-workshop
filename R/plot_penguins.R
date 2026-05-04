plot_penguins <- function(penguins, keys) {
  ggplot(penguins, aes(mean_precipitation_mm, body_mass_g, color = sex)) +
    geom_point() +
    geom_smooth(method = 'lm') +
    ggtitle(keys)
}