# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)
# Initialize an empty data frame to store health metrics
health_data <- data.frame(
  Date = as.Date(character()),
  Steps = numeric(),
  Calories = numeric(),
  Sleep = numeric(),
  stringsAsFactors = FALSE
)

# Function to add daily health metrics
add_health_data <- function(health_data, date, steps, calories, sleep) {
  new_entry <- data.frame(Date = as.Date(date, format = "%Y-%m-%d"), Steps = steps, Calories = calories, Sleep = sleep)
  health_data <- rbind(health_data, new_entry)
  return(health_data)
}

# User input loop for entering health data with validation
for (i in 1:4) {  # Example for four days of data entry
  repeat {
    date <- readline(prompt = "Enter date (YYYY-MM-DD): ")
    if (tryCatch(!is.na(as.Date(date, format = "%Y-%m-%d")), error = function(e) FALSE)) {
      break
    } else {
      cat("Invalid date format. Please enter date as YYYY-MM-DD.\n")
    }
  }
  
  # Validating numeric inputs
  repeat {
    steps <- as.numeric(readline(prompt = "Enter steps: "))
    if (!is.na(steps)) break else cat("Invalid input. Please enter a numeric value for steps.\n")
  }
  
  repeat {
    calories <- as.numeric(readline(prompt = "Enter calories: "))
    if (!is.na(calories)) break else cat("Invalid input. Please enter a numeric value for calories.\n")
  }
  
  repeat {
    sleep <- as.numeric(readline(prompt = "Enter hours of sleep: "))
    if (!is.na(sleep)) break else cat("Invalid input. Please enter a numeric value for sleep.\n")
  }
  
  # Add data to health_data
  health_data <- add_health_data(health_data, date, steps, calories, sleep)
}

# Reshape data to long format for ggplot
health_data_long <- health_data %>%
  pivot_longer(cols = c(Steps, Calories, Sleep), names_to = "Metric", values_to = "Value")

# Plot all metrics in one graph
ggplot(health_data_long, aes(x = Date, y = Value, color = Metric, group = Metric)) +
  geom_line(linewidth = 1) +
  labs(title = "Daily Health Metrics", x = "Date", y = "Value") +
  theme_minimal() +
  scale_color_manual(values = c("Steps" = "blue", "Calories" = "red", "Sleep" = "green")) +
  theme(legend.title = element_blank())

# Function to calculate average metrics
calculate_averages <- function(health_data) {
  avg_steps <- mean(health_data$Steps, na.rm = TRUE)
  avg_calories <- mean(health_data$Calories, na.rm = TRUE)
  avg_sleep <- mean(health_data$Sleep, na.rm = TRUE)
  
  return(data.frame(Average_Steps = avg_steps, Average_Calories = avg_calories, Average_Sleep = avg_sleep))
}

# Calculate and print averages
averages <- calculate_averages(health_data)
print(averages)