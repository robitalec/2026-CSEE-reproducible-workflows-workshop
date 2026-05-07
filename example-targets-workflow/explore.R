library(targets)
tar_source('R')

# Look at the workflow
tar_visnetwork(targets_only = TRUE)

# Run the workflow
tar_make()

# Read an output
tar_read(prepared_counts)

tar_read(fig_counts, branches = 1)

# Load an output
tar_load(prepared_penguins)

ggplot(prepared_penguins) +
  geom_histogram(aes(flipper_length_mm))

# Metadata
tar_meta()

tar_meta(ends_with('counts'))

View(tar_meta())
