# Targets
library(targets)
library(tarchetypes)

# Packages
library(pak)
library(renv)
options('renv.config.pak.enabled' = TRUE)

# General
library(data.table)
library(dplyr)
library(janitor)
library(rlang)
library(usethis)
library(fs)

# Plots
library(ggplot2)
library(visNetwork)

# Models
library(modelsummary)

# Testing
library(testthat)

# Data
library(palmerpenguins)

# Quarto
library(quarto)

# Conflicts
library(conflicted)
conflicts_prefer(dplyr::filter)
conflicts_prefer(dplyr::first)
conflicts_prefer(palmerpenguins::penguins_raw)
