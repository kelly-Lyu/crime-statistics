#### Preamble ####
# Purpose: Set up and pre-processing Police Annual Statistical Report dataset
# Author: Kelly Lyu
# Date: 24 January 2024
# Contact: kelly.lyu@mail.utoronto.ca
# Pre-requisites: None


#### Workspace setup ####
install.packages("opendatatoronto") # For getting data
library(opendatatoronto)
install.packages("tidyverse")
library(tidyverse)
install.packages("lubridate")
library(lubridate)
install.packages("knitr")
library(knitr)

# Get police annual statistics report package
package <- show_package("police-annual-statistical-report-reported-crimes")
package

# Load the reported crimes resources in the package
resources <- 
  list_package_resources("police-annual-statistical-report-reported-crimes") %>%
  filter(name == "Reported Crimes.csv") %>%
  get_resource()

# Save data
write_csv(x = resources, file = "Reported Crimes.csv")

# Display the head of the dataset
head(resources)

