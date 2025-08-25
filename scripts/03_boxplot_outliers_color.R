# Load necessary library
install.packages("extrafont")

library(ggplot2)
library(extrafont)


# Set the directory containing the files
directory <- "/Volumes/TOSHIBA EXT/TRICHODERMA/Genomes_fungi/outputs/statistics/final_snpcounts/norm_data"

# Get a list of all files in the directory
file_list <- list.files(path = directory, pattern = "*norm.txt", full.names = TRUE)

# Initialize an empty data frame to store the data
data_combined <- data.frame()

# Loop through each file and extract the last column
for (file in file_list) {
  # Read the TXT file
  data <- read.table(file, header = TRUE, sep = "\t") # Adjust sep if needed
  
  # Get the last column (assumed to be percentages)
  percentage_column <- data[, ncol(data)]
  
  # Get the file name
  file_name <- basename(file)
  
  # Create a data frame with the percentages and the file name
  temp_data <- data.frame(
    percentage = percentage_column,
    file = file_name
  )
  
  # Combine the data
  data_combined <- rbind(data_combined, temp_data)
}

# Create the box plot
p <- ggplot(data_combined, aes(x = file, y = percentage)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Gene changes between Trichoderma species and T9",
       x = "Species comparison",
       y = "% of change") +
  theme_classic() + 
  theme(
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    axis.text = element_text(size = 10),
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.title = element_text(hjust = 0.5)
  )

# Extract the plot data
plot_data <- ggplot_build(p)$data[[1]]

# Initialize lists to store outliers, first quartiles, and fourth quartiles
outliers_list <- list()
first_quartiles <- list()
fourth_quartiles <- list()

# Loop through the plot data to extract quartiles and outliers
for (i in 1:nrow(plot_data)) {
  file_name <- plot_data$group[i]
  
  # Extract the first and fourth quartiles
  first_quartiles[[file_name]] <- plot_data$ymin[i]
  fourth_quartiles[[file_name]] <- plot_data$ymax[i]
  
  # Extract the outliers
  outliers <- plot_data$outliers[[i]]
  outliers_list[[file_name]] <- outliers
}

# Print the first and fourth quartiles, and outliers

cat("\nOutliers:\n")
write.table(outliers, file="/Volumes/TOSHIBA EXT/TRICHODERMA/Genomes_fungi/outputs/statistics/final_snpcounts/2outliers_boxplot.txt", sep="\t")

# Display the box plot
print(p)

# Save the plot as a PDF file
ggsave("/Volumes/TOSHIBA EXT/TRICHODERMA/Genomes_fungi/outputs/statistics/final_snpcounts/boxplot_9species_prueba3.pdf", plot = p, width = 8, height = 6)
