# Developing a reproducible workflow in R using functions, {targets} and {renv}

This workshop is designed to introduce function-oriented programming as an alternative to script-based workflows. Functions are combined with input data in a {targets} pipeline to reduce analysis errors and mental load. {renv} and {conflicted} are introduced to help manage package versions and conflicts. 

Developed by Alec L. Robitaille (Memorial University of 
Newfoundland and Labrador) and Isabella C. Richmond (Concordia University) and first delivered as a
[workshop](https://github.com/robitalec/2023-CSEE-reproducible-workflows-workshop) for the 2023 conference of Canadian Society for Ecology and Evolution. 

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


## Setup

This workshop is aimed at improving our ability to use and create
*reproducible workflows.* All the materials should be accessible from
the side bar (slides, exercises, resources for further reading, and the 
accompanying GitHub repository. 

We don't have any strict dependencies on specific versions of R or R
packages, but it would be good to have updated versions of the packages below
and at least R version > 4.0. 

We are using Quarto to build the workshop's website and for some exercises, so it
would be helpful for you to install it too. Install first the Quarto CLI from the
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
install.packages('pak')
pak::pkg_install(pkgs)
```

To download the workshop materials, use this command:

```r
library(usethis)

# (Set your own destination directory)
use_course(
  'https://github.com/robitalec/reproducible-workflows-workshop/archive/refs/heads/main.zip', 
  destdir = '~/Documents'
)
```

Or by downloading and unziping the ZIP file at this link:
<https://github.com/robitalec/reproducible-workflows-workshop/archive/refs/heads/main.zip>.

Then open up the RStudio project.

## Data

Example data for this workshop are borrowed from the Palmer Long-Term
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

-   studyName
-   Date GMT
-   Time GMT
-   Island
-   Colony
-   Adults
-   Chicks

[Data package
metadata](https://portal.edirepository.org/nis/metadataviewer?packageid=knb-lter-pal.88.8)

[Data download link
(CSV)](https://github.com/PAL-LTER/pal-seabirds/blob/main/formatted/Adelie_Chick_Production/Adelie_Chick_Production_1992_2020.csv)


## Vocabulary

A small vocabulary note: we use "workflow" and "pipeline" interchangeably throughout this workshop.


## LICENSE

This project is released under the GNU General Public License v3.0. Read
it
[here](https://github.com/robitalec/reproducible-workflows-workshop/blob/main/LICENSE).
