# === Extended {targets} pipeline -----------------------------------------
# Alec L. Robitaille, Isabella C. Richmond



# Source ------------------------------------------------------------------
library(targets)
tar_source('R')



# Variables ---------------------------------------------------------------
# Column names
x_col_counts <- 'mean_temperature_c_yearly'
y_col_counts <- 'chicks_avg'

x_col_penguins <- 'mean_precipitation_mm_yearly'
y_col_penguins <- 'body_mass_g_avg'
color_col_penguins <- 'sex'

# Directories
dir_output <- 'output'
dir_figures <- 'figures'

if (!dir.exists(dir_output)) dir.create(dir_output)
if (!dir.exists(dir_figures)) dir.create(dir_figures)

# Filters
filter_years <- seq(2005, 2015)


# Targets -----------------------------------------------------------------
c(
    # Files
    tar_file_read(
      counts_raw,
      'raw-data/adelie-adult-chick-counts.csv',
      read.csv(!!.x)
    ),

    tar_file_read(
      weather_raw,
      'raw-data/weather-timeseries.csv',
      read.csv(!!.x)
    ),

    tar_target(
      penguin_raw,
      palmerpenguins::penguins_raw
    ),

    # Prepare
    tar_target(
      full_datasets,
      prepare_csv(counts_raw, weather_raw, penguin_raw)
    ),

    # Average colony size & body morphology
    tar_target(
      penguin_avgs,
      avg_colony_size(full_datasets, filter_years)
    ),

    # Group
    tar_group_by(
      group_counts,
      penguin_avgs[['counts']],
      island
    ),

    tar_group_by(
      group_penguins,
      penguin_avgs[['penguins']],
      island
    ),

    # Keys for groups
    tar_target(
      counts_keys,
      unique(group_counts$island),
      pattern = map(group_counts)
    ),

    tar_target(
      penguin_keys,
      unique(group_penguins$island),
      pattern = map(group_penguins)
    ),

    # Model by group
    tar_target(
      model_chicks_groups,
      lm(chicks_avg ~ mean_temperature_c_yearly, data = group_counts),
      pattern = map(group_counts),
      iteration = 'list'
    ),


    tar_target(
      model_penguins_groups,
      lm(body_mass_g_avg ~ mean_precipitation_mm_yearly:sex, data = group_penguins),
      pattern = map(group_penguins),
      iteration = 'list'
    ),

    # Plot by group
    tar_target(
      plot_groups_counts,
      plot_xy(group_counts, x_col_counts, y_col_counts) + ggtitle(counts_keys),
      pattern = map(group_counts, counts_keys),
      iteration = 'list'
    ),

    tar_target(
      plot_groups_penguins,
      plot_xy(group_penguins, x_col_penguins, y_col_penguins, color_col_penguins) + ggtitle(penguin_keys),
      pattern = map(group_penguins, penguin_keys),
      iteration = 'list'
    ),


    # Save plots
    tar_target(
        save_plots_counts,
        ggsave(filename = paste0(file.path(dir_figures, counts_keys), '.png'),
               plot = plot_groups_counts),
        pattern = map(plot_groups_counts, counts_keys),
        format = 'file'
    ),

    # Write tables
    tar_target(
      save_model_tables,
      modelsummary(model_chicks_groups %>% setNames(counts_keys), output = file.path(dir_output, 'chicks_model-summaries.png'))
    ),

    # Report
    tar_quarto(
      render,
      file.path('paper', 'manuscript.qmd')
    )

)