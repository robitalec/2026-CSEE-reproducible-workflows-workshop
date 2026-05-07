library(targets)
tar_source('R')


# Visnetwork
tar_visnetwork()

tar_visnetwork(targets_only = TRUE)

tar_visnetwork(ends_with('counts'))


# Make
tar_make()


# Load
tar_read(prepared_counts)

tar_load(mean_counts_weather)

tar_read(fig_counts)


# Metadata
tar_meta()

tar_meta(ends_with('counts'))

View(tar_meta())
