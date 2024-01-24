#### Preamble ####
# Purpose: Test for the Simulation
# Author: Kelly Lyu
# Date: 24 January 2024
# Contact: kelly.lyu@mail.utoronto.ca
# Pre-requisites: None


# Test 1: Correct Year Range
test_correct_year_range <- function(simulated_data) {
  if (all(simulated_data$year >= 2014 & simulated_data$year <= 2022)) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# Test 2: Rate of Clearance in Correct Range
test_rate_of_clearance_range <- function(simulated_data) {
  if (all(simulated_data$rate_of_clearance >= 0 & simulated_data$rate_of_clearance <= 1)) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# Test 3: Valid Police Divisions
test_valid_police_divisions <- function(simulated_data, divisions) {
  if (all(simulated_data$police_division %in% divisions)) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

