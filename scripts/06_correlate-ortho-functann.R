## Este script sirve para correlacionar ortólogos de T9 con sus anotaciones funcionales
# Cargar librerías necesarias
library(dplyr)

orthofile <- read.table("~/Desktop/Bioinformatics/Hongos/T9_new/T9-Ortho/ortho-complete/T22-data.txt", header = TRUE, stringsAsFactors = FALSE)
annotation <- read.csv("~/Desktop/Bioinformatics/Hongos/T9_new/raw_data/MM_0blr0hus.emapper.annotations_T9.csv", header = TRUE, stringsAsFactors = FALSE)

# Renombrar columnas de los archivos
colnames(orthofile) <- c("GeneID", "count_percentage", "Trichoderma_harzianum_T9")
colnames(annotation)[1] <- "Trichoderma_harzianum_T9"
colnames(annotation)[8] <- "Description"

# Join para obtener las descripciones
intersected_data <- left_join(orthofile, annotation[, c("Trichoderma_harzianum_T9", "Description")], by = "Trichoderma_harzianum_T9")

# Guardar el resultado en un archivo CSV
write.csv(intersected_data, "~/Desktop/Bioinformatics/Hongos/T9_new/T9-Ortho/annotated-data/T9-T22-orthoann.csv", row.names = FALSE)