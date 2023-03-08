library("dplyr")
library("tidyr")
library("ggplot2")
library("lubridate")

# Load the data from the CSV file
all_items <- read.csv("/Users/jamesmoy/Desktop/INFO 201/A3/a3-spl-checkouts-jmoy1101/2022-2023-All-Checkouts-SPL-Data.csv")

# Filter for the desired book and select the relevant variables
TwoNovel_CheckoutsOverTime <- all_items %>%
  filter(Title == "The Therapist: A Novel (unabridged)") %>%
  select(CheckoutType, CheckoutYear, CheckoutMonth, Checkouts)

# Group by CheckoutType, CheckoutYear, and CheckoutMonth and count the number of checkouts
comparing_checkouts <- TwoNovel_CheckoutsOverTime %>%
  group_by(CheckoutType, CheckoutYear, CheckoutMonth, Checkouts) %>%
  summarize(Count = n())

# Create a line chart to visualize the trends over time
ggplot(comparing_checkouts, aes(x = CheckoutMonth, y = Checkouts, color = CheckoutYear)) +
  geom_line() +
  labs(title = "Checkouts Over Time for 'The Therapist: A Novel (unabridged)'",
       x = "Checkout Month",
       y = "Number of Checkouts",
       color = "Checkout Year")



#This chart filters the data for a specific book titled "The Therapist: A Novel (unabridged)", and selects relevant variables including CheckoutType, CheckoutYear, and CheckoutMonth. 
#The data is grouped by CheckoutType, CheckoutYear, and CheckoutMonth, and the number of checkouts is counted using the summarize() function. 
#A line chart is created using ggplot() to visualize trends over time. The x-axis represents the month of checkout, while the y-axis represents the number of checkouts. The lines in the chart are colored by year, providing a breakdown of the number of checkouts by checkout type, year, and month. The purpose of this filter is to show how the number of checkouts for the book varies over time.