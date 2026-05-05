# === Extended {targets} pipeline -----------------------------------------
# Alec L. Robitaille, Isabella C. Richmond

# Source ------------------------------------------------------------------
library(targets)
tar_source('R')


# Variables ---------------------------------------------------------------
# Directories
dir_output <- 'output'
dir_figures <- 'figures'
if (!dir.exists(dir_output)) {
  dir.create(dir_output)
}
if (!dir.exists(dir_figures)) {
  dir.create(dir_figures)
}

# File paths
filepath_counts <- file.path('raw-data', 'adelie-adult-chick-counts.csv')
filepath_weather <- file.path('raw-data', 'weather-timeseries.csv')

# Filters
filter_years <- seq(2005, 2015)


# Targets -----------------------------------------------------------------
c(
  # Track raw files, and read in
  tar_file_read(
    counts,
    filepath_counts,
    read.csv(!!.x)
  ),

  tar_file_read(
    weather,
    filepath_weather,
    read.csv(!!.x)
  ),

  # Join counts and weather
  tar_target(
    prepared_counts,
    merge_counts_weather(counts, weather)
  ),

  # Join penguins and weather
  tar_target(
    prepared_penguins,
    merge_penguins_weather(palmerpenguins::penguins_raw, weather)
  ),

  # Mean counts vs. weather
  tar_target(
    mean_counts_weather,
    mean_counts(prepared_counts, filter_years)
  ),

  # Group by island
  tar_group_by(
    group_counts,
    mean_counts_weather,
    island
  ),

  tar_group_by(
    group_penguins,
    prepared_penguins,
    island
  ),

  # Keys for groups
  tar_target(
    keys_counts,
    unique(group_counts$island),
    pattern = map(group_counts)
  ),

  tar_target(
    keys_penguins,
    unique(group_penguins$island),
    pattern = map(group_penguins)
  ),

  # Model by group
  tar_target(
    model_counts,
    lm(chicks_avg ~ mean_temperature_c_yearly, data = group_counts),
    pattern = map(group_counts),
    iteration = 'list'
  ),

  tar_target(
    model_penguins,
    lm(body_mass_g ~ mean_precipitation_mm:sex, data = group_penguins),
    pattern = map(group_penguins),
    iteration = 'list'
  ),

  # Plot by group
  tar_target(
    fig_counts,
    plot_counts(group_counts, keys_counts),
    pattern = map(group_counts, keys_counts),
    iteration = 'list'
  ),

  tar_target(
    fig_penguins,
    plot_penguins(group_penguins, keys_penguins),
    pattern = map(group_penguins, keys_penguins),
    iteration = 'list'
  ),

  # Save plots
  tar_target(
    save_fig_counts,
    ggsave(
      filename = paste0(file.path(dir_figures, keys_counts), '.png'),
      plot = fig_counts
    ),
    pattern = map(fig_counts, keys_counts),
    format = 'file'
  ),

  # Write tables
  tar_target(
    model_tables,
    modelsummary(setNames(model_counts, keys_counts))
  ),

  # Report
  tar_quarto(
    render,
    file.path('paper', 'manuscript.qmd')
  )
)
