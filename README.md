---
editor: 
  markdown: 
    wrap: 72
---

# Reproducible workflows workshop

## Developing a reproducible workflow in R using functions, {targets} and {renv}

Originally developed for a
[workshop](https://github.com/robitalec/2023-CSEE-reproducible-workflows-workshop)
at CSEE 2023 by:

-   Alec L. Robitaille (Memorial University of Newfoundland and
    Labrador)
-   Isabella C. Richmond (Concordia University)

## Schedule

Projects

-   Directories
-   READMEs
-   RStudio Projects

*Short break*

Functions

-   Introduction
-   Recommended approach
-   Checks
-   Options

*Lunch break*

{targets}

-   Introduction
-   Writing workflows
-   Visualizing
-   Running workflows
-   Extensions

*Short break*

{renv} + {conflicted}

-   Saving package versions
-   Checking conflicts

## Learning goals

Overall

-   Approach analyses in a more holistic way (whole project vs script by
    script)
-   Share data across projects and software versions with minimal
    stress 
-   Use workflows that reduce analysis errors and mental load

Section 1: Projects

-   Construct a RStudio project that is thoroughly documented using file
    structure and data management best practices
-   Use RStudio projects to effectively share their own work, and use
    other people's

Section 2: Functions

-   Read and understand structure of functions in R
-   Refactor code into functions that do one thing
-   Add tests and checks to ensure functions work and error when
    expected
-   Recognize the value of functions as chunks of code that are reusable
    and easier to debug

Section 3: {targets}

-   (For a given project) map out relationships between inputs, outputs
    and analysis steps
-   Identify discrete chunks/steps and write corresponding (or use
    available) functions 
-   Execute a workflow in {targets} that reads in data, performs a
    function, and saves an output
-   Recognize the value of workflows for reducing mental load and
    improving efficiency

Section 4: {renv} + {conflicted}

-   Use {renv} to preserve current package versions to ensure the
    environment is reproducible, portable and isolated
-   Use {conflicted} to detect conflicting function names

## Setup

This workshop is aimed at improving our ability to use and create
*reproducible workflows.* All the materials should be accessible from
the side bar (slides, exercises, resources for further reading, and the
link to the GitHub repository can be accessed by clicking on the GitHub
icon).

We don't have any strict dependencies on specific versions of R or R
packages, but it would be good to have at least R version 4.0 and a
recent version of RStudio. 

We are using Quarto to build the workshop's website and exercises, so it
could be helpful for you to install it too. If you don't have time to,
you can always complete exercises in an R script - so no pressure. 

Install first the Quarto CLI from the
[here](https://quarto.org/docs/get-started/) then the package with the
command at the bottom.

Please install the following packages (after updating R):

``` r
pkgs <- c(
  'targets',
  'igraph',
  'data.table',
  'dplyr',
  'ggplot2',
  'testthat',
  'janitor',
  'renv',
  'rlang',
  'conflicted',
  'palmerpenguins',
  'visNetwork',
  'quarto',
  'xml2',
  'downlit',
  'usethis'
)

install.packages(pkgs)
```


******BROKEN***************
To download the workshop materials for a participant, use this command:

``` r
library(usethis)

# (Set your own destination directory)
use_course(
    'https://github.com/robitalec/reproducible-workflows-workshop/archive/refs/heads/participant.zip', 
    destdir = '~/Documents')
```

Or by downloading and unziping the ZIP file at this link:
<https://github.com/robitalec/reproducible-workflows-workshop/archive/refs/heads/participant.zip>.


****************************


Then open up the RStudio project.

## Data

Example data for this workshop is borrowed from the Palmer Long-Term
Ecological Research (LTER). Here is the study description from the
[Palmer LTER site](https://pallter.marine.rutgers.edu/):

> The Palmer Long-Term Ecological Research (LTER) study area is located
> to the west of the Antarctic Peninsula extending South and North of
> the Palmer Basin from onshore to several hundred kilometers off shore.
> Palmer Station is one of the three United States research stations
> located in Antarctica. It is on Anvers Island midway down the
> Antarctic Peninsula at latitude 64.7 South, longitude 64.0 West.

> The Palmer LTER studies a polar marine biome with research focused on
> the Antarctic pelagic marine ecosystem, including sea ice habitats,
> regional oceanography and terrestrial nesting sites of seabird
> predators. The Palmer LTER is one of more than 26 LTER research sites
> located throughout the United States, Puerto Rico and Tahiti; each
> focused on a specific ecosystem, that together constitute the LTER
> Network.

We gratefully acknowledge the Palmer LTER for releasing data freely and
openly for diverse uses - in our case for training analytical skills of
researchers in ecology.

### Penguins

The first dataset is already available in R through the
[`palmerpenguins` R
package](https://allisonhorst.github.io/palmerpenguins/). There is a raw
version and a cleaned version. They contain data for 344 penguins, with
the following variables (cleaned version):

-   species
-   island
-   bill_length_mm
-   bill_depth_mm
-   flipper_length_mm
-   body_mass_g
-   sex
-   year

### Weather timeseries

The following datasets are archived in the [Palmer LTER Data
Catalog](https://pallter.marine.rutgers.edu/catalog/edi/). To download
the data to the `raw-data/` directory, run the function
`download_example_data()` (`R/download_example_data.R`).

This second dataset contains monthly averaged weather timeseries from
Palmer Station, Antarctica, with the following variables:

-   Date
-   Mean Temperature (C)
-   Temperature Count
-   Mean Pressure (mbar)
-   Pressure Count
-   Mean Precipitation (mm)
-   Sum Precipitation (mm)
-   Precipitation Count
-   Mean Sea Surface Temperature (C)
-   Sea Surface Temperature Count
-   Mean Windspeed (knots)
-   Windspeed Count

[Data package
metadata](https://portal.edirepository.org/nis/metadataviewer?packageid=knb-lter-pal.189.10)

[Data download link
(CSV)](https://github.com/PAL-LTER/pal-weather/blob/main/data_v10/PalmerStation_Monthly_Weather.csv)

### Adelie penguin adult and chick counts

The third dataset contains Adelie penguin adult and chick counts

-   studyName\
-   Date GMT\
-   Time GMT\
-   Island\
-   Colony\
-   Adults\
-   Chicks

[Data package
metadata](https://portal.edirepository.org/nis/metadataviewer?packageid=knb-lter-pal.88.8)

[Data download link (CSV)](https://github.com/PAL-LTER/pal-seabirds/blob/main/formatted/Adelie_Chick_Production/Adelie_Chick_Production_1992_2020.csv)

## LICENSE

This project is released under the GNU General Public License v3.0. Read
it
[here](https://github.com/robitalec/reproducible-workflows-workshop/blob/main/LICENSE).
