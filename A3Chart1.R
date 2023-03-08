library("dplyr")
library("tidyr")
library("ggplot2")
library("lubridate")
 
all_items <- read.csv("/Users/jamesmoy/Desktop/INFO 201/A3/a3-spl-checkouts-jmoy1101/2022-2023-All-Checkouts-SPL-Data.csv")

Comparing_MaterialType_CheckoutYear <- all_items %>%
  group_by(MaterialType, CheckoutYear) %>%
  summarize(Count = n())


ggplot(Comparing_MaterialType_CheckoutYear, aes(x = CheckoutYear, y = MaterialType, size = Count, color = Count)) +
  geom_point() +
  scale_size(range = c(1, 5)) +
  labs(title = "Comparison of Material Type and Checkout Year for 'The Therapist: A Novel (unabridged)'",
       x = "Checkout Year",
       y = "Material Type",
       size = "Count",
       color = "Count") +
  theme_classic()
#This chart depicts the relationship between MaterialType, CheckoutYear, and Title over time measured in years. 
#The Y-Axis displays the material type and the x-axis shows checkout year
#From this visual representation, we can see that 
