#James Moy
#Summmary information

# Install packages 
library("readxl")
library("dplyr")
library("tidyr")
library("ggplot2")
library("lubridate")

# Loading the data from excel file

all_items <- read.csv("/Users/jamesmoy/Desktop/INFO 201/A3/a3-spl-checkouts-jmoy1101/2022-2023-All-Checkouts-SPL-Data.csv")
# Group by CheckoutType and Subjects to determine whether there exists a relationship between the two over time


Comparing_CheckoutTypeandSubjects <- all_items %>%
  group_by(Subjects, CheckoutType) %>%
  summarise(count = n()) %>%
  ungroup()

# Grouping by MaterialType, CheckoutYear, and Title over time measured in years specifically focusing on the novel:"The Therapist: A Novel (unabridged)" measured against the other factors

Novel_CheckoutsOverTime <- all_items %>%
  filter(Title == "The Therapist: A Novel (unabridged)") %>%
  select(MaterialType, CheckoutYear)

# Group by Min/Max for year and month of the book "The Therapist: A Novel (unabridged)" and calculate summary statistics

max_audiobook_month <- all_items %>%
filter(MaterialType == "AUDIOBOOK") %>%
group_by(CheckoutMonth) %>%
  summarize(num_checkouts = n()) %>%
  slice_max(num_checkouts, n = 1)

max_audiobook_month$CheckoutMonth

summary <- c("The data was collected, owned, and published by the Seattle Public Library I created several Datasets. The first one was a measure of subjects, checkout count, and checkout type to determine if there was a relationship between the specific subjects of the books being checked out and the measure of count for those specific types of checkouts. The data was both collected and generated through internal library systems that tracked checkout dates, titles, subjects, and technology mediums through which they were checked out.I believe the data was collected to create a dataset of specific logs for recording checkouts of titles, when they were checked out, the amount of times they were checked out, and the medium from which it was rented. This way the library system would have logs and a historical record of all the archives and activity using their resources.", "Potential Biases

One ethical question I should consider is how the dataset and the results from the affects of analyzing certain trends in the data may affect the authors of the specific titles and whether or not the records may have certain indications. We should definitley consult with the owners of the dataset and any authors that may be indirectly or directly affected.The data provided by the Seattle Public Library Checkouts by Title dataset can provide valuable insights into library patron behavior and reading preferences however there are some limitations to consider:
             - Limited Scope
             - Missing Data
             - Limited Demographic Information
             - Limited Context
             - Selection Bias
             - Changing Library Practices
             - Limited Context
             - Selection Bias 
             - Changing Library Practices
             - Non-representative Sample
             
             Limited scope: The data only covers the Seattle Public Library system and may not be representative of broader reading habits or trends in other parts of the country or the world. Therefore, it may be difficult to generalize findings from this dataset to other populations.
             
             Missing data: There may be missing data or incomplete records, which can lead to inaccurate analyses or incomplete conclusions. This can happen if a patron opts out of sharing their data or if there are errors in recording data.
             
             Limited demographic information: The dataset does not provide demographic information about the patrons who checked out the materials, such as age, gender, race, or income level. Without this information, it may be difficult to determine if there are specific patterns in reading preferences among different groups of people.
             
             Limited context: The dataset only provides information on the number of checkouts per title and does not provide any additional context or information about the books, such as reviews, ratings, or publication date, which can influence reading habits.
             
             Selection bias: The data may be biased towards certain titles, such as popular bestsellers, which can skew the data and make it difficult to generalize findings.
             
             Changing library practices: As library practices change over time, it may be difficult to compare data from different time periods or to draw conclusions about long-term trends in library patron behavior.

             Non-representative sample: The dataset only includes data on items that were checked out from the library, which may not be representative of all materials that patrons are interested in reading. Therefore, it may be difficult to determine if certain types of books or materials are more popular than others.")

