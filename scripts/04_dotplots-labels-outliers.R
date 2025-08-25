## 30/07/25 Este script permite obtener un dotplot con los outliers marcados en negro y sus labels en rojo. También se descarga la lista de los outliers con sus respectivos labels y porcentajes de cambio. Se puede obtener también el porcentaje de outliers sobre el total de genes.

# Cambiar el archivo por el del genoma que queremos usar
normalized_results <- read.table("~/Desktop/Bioinformatics/Hongos/T9_new/norm_data/T9_Th0179_norm.txt", header=TRUE, row.names=1, sep="\t")

# Filter out rows where count_percentage is 0
normalized_results_filtered <- normalized_results[normalized_results$count_percentage != 0, ]

# Identify outliers based on the IQR method
Q1 <- quantile(normalized_results_filtered$count_percentage, 0.25)
Q3 <- quantile(normalized_results_filtered$count_percentage, 0.75)
IQR_value <- IQR(normalized_results_filtered$count_percentage)

lower_bound <- Q1 - 1.5 * IQR_value
upper_bound <- Q3 + 1.5 * IQR_value

# Find outliers
outliers <- normalized_results_filtered$count_percentage[normalized_results_filtered$count_percentage < lower_bound | normalized_results_filtered$count_percentage > upper_bound]

# Add a column to mark outliers in the filtered data
normalized_results_filtered$highlight <- ifelse(normalized_results_filtered$count_percentage %in% outliers, "Outlier", "Non-Outlier")

# Add a column for labeling only the outliers
normalized_results_filtered$label <- ifelse(normalized_results_filtered$highlight == "Outlier", 
                                            normalized_results_filtered$GeneID, 
                                            NA)

# Extraer los outliers con sus labels
outlier_genes <- normalized_results_filtered[normalized_results_filtered$highlight == "Outlier", ]

outlier_genes_clean <- outlier_genes[, !(names(outlier_genes) %in% c("highlight", "label"))]

# Ver los resultados
head(outlier_genes)
write.table(outlier_genes_clean, file = "~/Desktop/Bioinformatics/Hongos/T9_new/outliers/outliers_T9_Th0179.txt", sep = "\t", row.names = FALSE)

# Número total de genes analizados
total_genes <- nrow(normalized_results_filtered)

# Número de outliers
num_outliers <- sum(normalized_results_filtered$highlight == "Outlier")

# Porcentaje de outliers
percentage_outliers <- round((num_outliers / total_genes) * 100, 2)

# Ver porcentaje
percentage_outliers

# Plot: outliers in black with labels, non-outliers in light grey
library(tidyverse)
normalized_results_filtered |> 
  ggplot(aes(x = GeneID, y = count_percentage, color = highlight)) + 
  geom_point() +
  scale_color_manual(values = c("Outlier" = "black", "Non-Outlier" = "lightgrey")) +
  geom_text(aes(label = label), vjust = -0.5, size = 3, color = "red") +  # Add labels for outliers
  theme_classic() + 
  theme(axis.title = element_text(size=18), 
        plot.title = element_text(hjust = 0.5),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        legend.position = "none") +
  ggtitle(paste0("SNP count per gene with T9 on T. harzianum Th0179\n(", 
                 percentage_outliers, "% outliers)"))

## Guardar imagen como pdf tamaño carta o png de 1500 x 1000.
