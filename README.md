Health Metrics Data Entry and Visualization in R
Overview
This R script is designed to help users log and analyze daily health metrics, specifically steps, calories burned, and hours of sleep. It includes functions to add new entries, validate user input, and calculate average metrics over the data entries. Additionally, it visualizes the collected data using a line plot with the ggplot2 library.

Required Libraries
To run this script, the following R libraries are required:

ggplot2 - for creating the visualization of health metrics.
dplyr - for data manipulation tasks.
tidyr - for reshaping the data for plotting.
You can install any missing libraries using the following command:

install.packages(c("ggplot2", "dplyr", "tidyr"))
Usage
Data Entry Loop: The script prompts the user to input daily metrics for a specified number of days. Each day’s date, steps, calories, and sleep are entered manually. Input validation ensures correct date and numeric formats.

Visualization: After entering the data, the script reshapes it into a long format suitable for plotting. It then generates a line plot showing trends in steps, calories, and sleep over time.

Calculate Averages: The script calculates the average steps, calories burned, and sleep hours, providing a summary of health metrics across the recorded days.

Functions
add_health_data: Adds a new day’s metrics to the health_data data frame.
calculate_averages: Calculates average steps, calories, and sleep, returning these as a data frame.
How to Run
To run the script, source it in R or RStudio and follow the prompts to enter daily health metrics.

Example Output
The script outputs a plot of the daily metrics and prints a summary of the average values for steps, calories, and sleep.

Contact
For any questions or issues with the script, feel free to reach out.
