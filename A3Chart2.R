library("dplyr")
library("tidyr")
library("ggplot2")
library("lubridate")
library("scales")
 
all_items <- read.csv("/Users/jamesmoy/Desktop/INFO 201/A3/a3-spl-checkouts-jmoy1101/2022-2023-All-Checkouts-SPL-Data.csv")

Novel_CheckoutsOverTime <- all_items %>%
  filter(Title == "The Therapist: A Novel (unabridged)") %>%
  select(MaterialType, CheckoutYear, CheckoutMonth, Checkouts) 


ggplot(Novel_CheckoutsOverTime, aes(x = CheckoutYear, y = MaterialType, size = Checkouts)) +
  geom_point() +
  scale_size(range = c(1, 10)) +
  labs(title = "Comparison of Material Type and Checkout Year for 'The Therapist: A Novel (unabridged)'",
       x = "Checkout Year",
       y = "Material Type",
       size = "Count") 



ggplot(Novel_CheckoutsOverTime, aes(x = CheckoutMonth, y = MaterialType, size = Checkouts)) +
  geom_point() +
  scale_size(range = c(1, 10)) +
  labs(title = "Comparison of Material Type and Checkout Month for 'The Therapist: A Novel (unabridged)'",
       x = "Checkout Month(1-12)",
       y = "Material Type",
       size = "Count")


#The first chart shows the novel:"The Therapist: A Novel (unabridged)" measured against the factors of MaterialType and CheckoutYear.
#The second chart shows the novel:"The Therapist: A Novel (unabridged)" measured against the factors of MaterialType and CheckoutMonth.
