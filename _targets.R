# === Extended {targets} pipeline -----------------------------------------
# Alec L. Robitaille, Isabella C. Richmond



# Source ------------------------------------------------------------------
library(targets)
tar_source('R')



# Variables ---------------------------------------------------------------

# Column names
x_col <- 'date_gmt'
y_col <- 'adults'
color_col <- 'colony'

# Directories
dir_output <- 'output'
dir_figures <- 'figures'

if (!dir.exists(dir_output)) dir.create(dir_output)
if (!dir.exists(dir_figures)) dir.create(dir_figures)

# Filters
filter_years <- c(2005:2015)



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
      year
    ),

    tar_group_by(
      group_penguins,
      penguin_avgs[['penguins']],
      year, island
    ),

    # Model by group
    tar_target(
      model_chicks_groups,
      lm(chicks_avg ~ adults_avg:island, data = group_counts),
      pattern = map(group_counts),
      iteration = 'list'
    ),


    tar_target(
      model_penguins_groups,
      lm(body_mass_g_avg ~ flipper_length_mm_avg:sex, data = group_penguins),
      pattern = map(group_counts),
      iteration = 'list'
    ),


    # Plot by group
    tar_target(
        plot_groups,
        plot_xy(group_counts, x_col, y_col, color_col) + ggtitle(group_keys),
        pattern = map(group_counts, group_keys),
        iteration = 'list'
    ),

    # Save plots
    tar_target(
        save_plots,
        ggsave(filename = paste0(file.path(dir_figures, group_keys), '.png'),
               plot = plot_groups),
        pattern = map(plot_groups, group_keys),
        format = 'file'
    ),


    # Write tables
    tar_target(
        save_tables,
        fwrite(sums, file.path(dir_output, 'sums.csv')),
        format = 'file'
    ),

    # Manuscript
    tar_quarto(
        render,
        file.path('paper', 'manuscript.qmd')
    )

)