# Global.R
# Code that runs in this file is available to both ui.R and server.R

suppressMessages({
  library(shiny)
  library(tidyverse)
  library(magrittr)
  # library(rprojroot)
  # library(ggthemes)
  library(stringr)
  library(gapminder)
  library(scales)
  # library(tidyr)
  # library(plotly)
  # library(htmlwidgets)
  # library(ggvis)
  # library(gganimate) # library(devtools); install_github("dgrtwo/gganimate")
  library(colourpicker) # library(devtools); devtools::install_github("daattali/colourpicker")
  library(here)
  # library(logging) # may be useful for improved logging
})

# Set up better logging defaults
# options(shiny.error = function() {
#   logging::logerror(sys.calls() %>% as.character() %>% paste(collapse = ", "))
# })

# Directories are not necessary in this app, but I am leaving the code in, as
# you may want to know how to handle directories for apps hosted on shinyapps.io
# in future assignments.
rootDir <- here::here()

# If this leaves us in the shiny app dir, then we're good. Otherwise, we're in
# the DSCI_instructors repo, and we should navigate to the appropriate
# subdirectory.

# shinyapps.io server prints the following dir:
# "/srv/connect/apps/lab1solutions"
# Insert your shinyapps.io app name here (the '$' is regex for 'end of string'):
# if (str_detect("lab1solutions$", rootDir)) {
#   # Taking advantage of R's lack of block scope
#   # appDir will be a global variable
#   appDir <- rootDir
# } else {
#   lab1Dir <- file.path(rootDir, "solutions", "lab1")
#   appDir <- file.path(lab1Dir, "shiny_app")
# }

# Here we have done some code-splitting to keep us sane! We are storing a
# function in each file, and bringing in these functions to keep our server.R
# file small.

# Bring in geom function from external file
source(file.path(rootDir, "add_geom.R"))
# Bring in scale function from external file
source(file.path(rootDir, "add_scale.R"))


# construct named vector of possible y-axis variables. This will go into a selectInput
yAxisVars <- c("Life Expectancy" = "lifeExp", "Population" = "pop", "GDP Per Capita" = "gdpPercap")
# construct the inverse of the vector to allow R to grab the selectInput result
# and use the pretty name as an axis label. Unfortunately you must select from a
# vector by the name, and not the actual string value
yAxisNames <- c("lifeExp" = "Life Expectancy", "pop" = "Population", "gdpPercap" = "GDP Per Capita")
