TR274
#Assuming FastQC and Trimmomatic steps are not necessary

cd /home/garciav/Desktop/Trichoderma

# Step 1: Alignment
echo “Indexing reference genome…”
bwa index raw_data/genomas_reformateados/Trichoderma_harzianum_TR274.fa

echo "Running BWA MEM for alignment..."
bwa mem raw_data/genomas_reformateados/Trichoderma_harzianum_TR274.fa raw_data/T9/T9_S50_R1.trim.fastq.gz raw_data/T9/T9_S50_R2.trim.fastq.gz > outputs/results/sam/T9_harzTR274.aligned.sam

# Step 2: SAM to BAM conversion
echo "Converting SAM to BAM..."
samtools view -S -b outputs/results/sam/T9_harzTR274.aligned.sam > outputs/results/bam/T9_harzTR274.aligned.bam

# Step 3: Sorting BAM file
echo "Sorting BAM file..."
samtools sort -o outputs/results/bam/T9_harzTR274.aligned.sorted.bam outputs/results/bam/T9_harzTR274.aligned.bam

# Step 4: Variant calling
echo "Running bcftools mpileup..."
bcftools mpileup -O b -o outputs/results/bcf/T9_harzTR274_raw.bcf -f raw_data/genomas_reformateados/Trichoderma_harzianum_TR274.fa outputs/results/bam/T9_harzTR274.aligned.sorted.bam

echo "Running bcftools call..."
bcftools call --ploidy 1 -m -v -o outputs/results/vcf/T9_harzTR274_variants.vcf outputs/results/bcf/T9_harzTR274_raw.bcf

# Step 5: Variant filtering
echo "Filtering variants..."
vcfutils.pl varFilter outputs/results/vcf/T9_harzTR274_variants.vcf > outputs/results/vcf/T9_harzTR274_final_variants.vcf

echo "Pipeline completed successfully!"

____________________

Th0179
#Assuming FastQC and Trimmomatic steps are not necessary 

cd /home/garciav/Desktop/Trichoderma

# Step 1: Alignment
echo “Indexing reference genome…”
bwa index raw_data/genomas_reformateados/Trichoderma_harzianum_Th0179.fa

echo "Running BWA MEM for alignment..."
bwa mem raw_data/genomas_reformateados/Trichoderma_harzianum_Th0179.fa raw_data/T9/T9_S50_R1.trim.fastq.gz raw_data/T9/T9_S50_R2.trim.fastq.gz > outputs/results/sam/T9_harzTh0179.aligned.sam

# Step 2: SAM to BAM conversion
echo "Converting SAM to BAM..."
samtools view -S -b outputs/results/sam/T9_harzTh0179.aligned.sam > outputs/results/bam/T9_harzTh0179.aligned.bam

# Step 3: Sorting BAM file
echo "Sorting BAM file..."
samtools sort -o outputs/results/bam/T9_harzTh0179.aligned.sorted.bam outputs/results/bam/T9_harzTh0179.aligned.bam

# Step 4: Variant calling
echo "Running bcftools mpileup..."
bcftools mpileup -O b -o outputs/results/bcf/T9_harzTh0179_raw.bcf -f raw_data/genomas_reformateados/Trichoderma_harzianum_Th0179.fa outputs/results/bam/T9_harzTh0179.aligned.sorted.bam

echo "Running bcftools call..."
bcftools call --ploidy 1 -m -v -o outputs/results/vcf/T9_harzTh0179_variants.vcf outputs/results/bcf/T9_harzTh0179_raw.bcf

# Step 5: Variant filtering
echo "Filtering variants..."
vcfutils.pl varFilter outputs/results/vcf/T9_harzTh0179_variants.vcf > outputs/results/vcf/T9_harzTh0179_final_variants.vcf

echo "Pipeline completed successfully!"

____________________

Th3844
#Assuming FastQC and Trimmomatic steps are not necessary 

cd /home/garciav/Desktop/Trichoderma

# Step 1: Alignment
echo “Indexing reference genome…”
bwa index raw_data/genomas_reformateados/Trichoderma_harzianum_Th3844.fa

echo "Running BWA MEM for alignment..."
bwa mem raw_data/genomas_reformateados/Trichoderma_harzianum_Th3844.fa raw_data/T9/T9_S50_R1.trim.fastq.gz raw_data/T9/T9_S50_R2.trim.fastq.gz > outputs/results/sam/T9_harzTh3844.aligned.sam

# Step 2: SAM to BAM conversion
echo "Converting SAM to BAM..."
samtools view -S -b outputs/results/sam/T9_harzTh3844.aligned.sam > outputs/results/bam/T9_harzTh3844.aligned.bam

# Step 3: Sorting BAM file
echo "Sorting BAM file..."
samtools sort -o outputs/results/bam/T9_harzTh3844.aligned.sorted.bam outputs/results/bam/T9_harzTh3844.aligned.bam

# Step 4: Variant calling
echo "Running bcftools mpileup..."
bcftools mpileup -O b -o outputs/results/bcf/T9_harzTh3844_raw.bcf -f raw_data/genomas_reformateados/Trichoderma_harzianum_Th3844.fa outputs/results/bam/T9_harzTh3844.aligned.sorted.bam

echo "Running bcftools call..."
bcftools call --ploidy 1 -m -v -o outputs/results/vcf/T9_harzTh3844_variants.vcf outputs/results/bcf/T9_harzTh3844_raw.bcf

# Step 5: Variant filtering
echo "Filtering variants..."
vcfutils.pl varFilter outputs/results/vcf/T9_harzTh3844_variants.vcf > outputs/results/vcf/T9_harzTh3844_final_variants.vcf

echo "Pipeline completed successfully!"

____________________

M10
#Assuming FastQC and Trimmomatic steps are not necessary 

cd /home/garciav/Desktop/Trichoderma

# Step 1: Alignment
echo “Indexing reference genome…”
bwa index raw_data/genomas_reformateados/Trichoderma_M10_masked.fa

echo "Running BWA MEM for alignment..."
bwa mem raw_data/genomas_reformateados/Trichoderma_M10_masked.fa raw_data/T9/T9_S50_R1.trim.fastq.gz raw_data/T9/T9_S50_R2.trim.fastq.gz > outputs/results/sam/T9_M10.aligned.sam

# Step 2: SAM to BAM conversion
echo "Converting SAM to BAM..."
samtools view -S -b outputs/results/sam/T9_M10.aligned.sam > outputs/results/bam/T9_M10.aligned.bam

# Step 3: Sorting BAM file
echo "Sorting BAM file..."
samtools sort -o outputs/results/bam/T9_M10.aligned.sorted.bam outputs/results/bam/T9_M10.aligned.bam

# Step 4: Variant calling
echo "Running bcftools mpileup..."
bcftools mpileup -O b -o outputs/results/bcf/T9_M10_raw.bcf -f raw_data/genomas_reformateados/Trichoderma_M10_masked.fa outputs/results/bam/T9_M10.aligned.sorted.bam

echo "Running bcftools call..."
bcftools call --ploidy 1 -m -v -o outputs/results/vcf/T9_M10_variants.vcf outputs/results/bcf/T9_M10_raw.bcf

# Step 5: Variant filtering
echo "Filtering variants..."
vcfutils.pl varFilter outputs/results/vcf/T9_M10_variants.vcf > outputs/results/vcf/T9_M10_final_variants.vcf

echo "Pipeline completed successfully!"
____________________

T22
#Assuming FastQC and Trimmomatic steps are not necessary 

cd /home/garciav/Desktop/Trichoderma

# Step 1: Alignment
echo “Indexing reference genome…”
bwa index raw_data/genomas_reformateados/Trichoderma_T22_masked.fa

echo "Running BWA MEM for alignment..."
bwa mem raw_data/genomas_reformateados/Trichoderma_T22_masked.fa raw_data/T9/T9_S50_R1.trim.fastq.gz raw_data/T9/T9_S50_R2.trim.fastq.gz > outputs/results/sam/T9_T22.aligned.sam

# Step 2: SAM to BAM conversion
echo "Converting SAM to BAM..."
samtools view -S -b outputs/results/sam/T9_T22.aligned.sam > outputs/results/bam/T9_T22.aligned.bam

# Step 3: Sorting BAM file
echo "Sorting BAM file..."
samtools sort -o outputs/results/bam/T9_T22.aligned.sorted.bam outputs/results/bam/T9_T22.aligned.bam

# Step 4: Variant calling
echo "Running bcftools mpileup..."
bcftools mpileup -O b -o outputs/results/bcf/T9_T22_raw.bcf -f raw_data/genomas_reformateados/Trichoderma_T22_masked.fa outputs/results/bam/T9_T22.aligned.sorted.bam

echo "Running bcftools call..."
bcftools call --ploidy 1 -m -v -o outputs/results/vcf/T9_T22_variants.vcf outputs/results/bcf/T9_T22_raw.bcf

# Step 5: Variant filtering
echo "Filtering variants..."
vcfutils.pl varFilter outputs/results/vcf/T9_T22_variants.vcf > outputs/results/vcf/T9_T22_final_variants.vcf

echo "Pipeline completed successfully!"
____________________

CBS
#Assuming FastQC and Trimmomatic steps are not necessary 

cd /home/garciav/Desktop/Trichoderma

# Step 1: Alignment
echo “Indexing reference genome…”
bwa index raw_data/genomas_reformateados/Trichoderma_harzianum_CBS.fa

echo "Running BWA MEM for alignment..."
bwa mem raw_data/genomas_reformateados/Trichoderma_harzianum_CBS.fa raw_data/T9/T9_S50_R1.trim.fastq.gz raw_data/T9/T9_S50_R2.trim.fastq.gz > outputs/results/sam/3T9_harzCBS.aligned.sam

# Step 2: SAM to BAM conversion
echo "Converting SAM to BAM..."
samtools view -S -b outputs/results/sam/3T9_harzCBS.aligned.sam > outputs/results/bam/3T9_harzCBS.aligned.bam

# Step 3: Sorting BAM file
echo "Sorting BAM file..."
samtools sort -o outputs/results/bam/2T9_harzCBS.aligned.sorted.bam outputs/results/bam/3T9_harzCBS.aligned.bam

# Step 4: Variant calling
echo "Running bcftools mpileup..."
bcftools mpileup -O b -o outputs/results/bcf/3T9_harzCBS_raw.bcf -f raw_data/genomas_reformateados/Trichoderma_harzianum_CBS.fa outputs/results/bam/3T9_harzCBS.aligned.sorted.bam

echo "Running bcftools call..."
bcftools call --ploidy 1 -m -v -o outputs/results/vcf/3T9_harzCBS_variants.vcf outputs/results/bcf/3T9_harzCBS_raw.bcf

# Step 5: Variant filtering
echo "Filtering variants..."
vcfutils.pl varFilter outputs/results/vcf/3T9_harzCBS_variants.vcf > outputs/results/vcf/3T9_harzCBS_final_variants.vcf

echo "Pipeline completed successfully!"
____________________

IMI206040
#Assuming FastQC and Trimmomatic steps are not necessary 

cd /home/garciav/Desktop/Trichoderma

# Step 1: Alignment
echo “Indexing reference genome…”
bwa index raw_data/genomas_reformateados/Trichoderma_atroviride_IMI206040.fa

echo "Running BWA MEM for alignment..."
bwa mem raw_data/genomas_reformateados/Trichoderma_atroviride_IMI206040.fa raw_data/T9/T9_S50_R1.trim.fastq.gz raw_data/T9/T9_S50_R2.trim.fastq.gz > outputs/results/sam/T9_atroIMI206040.aligned.sam

# Step 2: SAM to BAM conversion
echo "Converting SAM to BAM..."
samtools view -S -b outputs/results/sam/T9_atroIMI206040.aligned.sam > outputs/results/bam/T9_atroIMI206040.aligned.bam

# Step 3: Sorting BAM file
echo "Sorting BAM file..."
samtools sort -o outputs/results/bam/T9_atroIMI206040.aligned.sorted.bam outputs/results/bam/T9_atroIMI206040.aligned.bam

# Step 4: Variant calling
echo "Running bcftools mpileup..."
bcftools mpileup -O b -o outputs/results/bcf/T9_atroIMI206040_raw.bcf -f raw_data/genomas_reformateados/Trichoderma_atroviride_IMI206040.fa outputs/results/bam/T9_atroIMI206040.aligned.sorted.bam

echo "Running bcftools call..."
bcftools call --ploidy 1 -m -v -o outputs/results/vcf/T9_atroIMI206040_variants.vcf outputs/results/bcf/T9_atroIMI206040_raw.bcf

# Step 5: Variant filtering
echo "Filtering variants..."
vcfutils.pl varFilter outputs/results/vcf/T9_atroIMI206040_variants.vcf > outputs/results/vcf/T9_atroIMI206040_final_variants.vcf

echo "Pipeline completed successfully!"

____________________

Guizhouense
#Assuming FastQC and Trimmomatic steps are not necessary 

cd /home/garciav/Desktop/Trichoderma

# Step 1: Alignment
echo “Indexing reference genome…”
bwa index raw_data/genomas_reformateados/Trichoderma_guizhouense_NJAU_4742.fa

echo "Running BWA MEM for alignment..."
bwa mem raw_data/genomas_reformateados/Trichoderma_guizhouense_NJAU_4742.fa raw_data/T9/T9_S50_R1.trim.fastq.gz raw_data/T9/T9_S50_R2.trim.fastq.gz > outputs/results/sam/T9_guizhouense.aligned.sam

# Step 2: SAM to BAM conversion
echo "Converting SAM to BAM..."
samtools view -S -b outputs/results/sam/T9_guizhouense.aligned.sam > outputs/results/bam/T9_guizhouense.aligned.bam

# Step 3: Sorting BAM file
echo "Sorting BAM file..."
samtools sort -o outputs/results/bam/3T9_guizhouense.aligned.sorted.bam outputs/results/bam/T9_guizhouense.aligned.bam

# Step 4: Variant calling
echo "Running bcftools mpileup..."
bcftools mpileup -O b -o outputs/results/bcf/T9_guizhouense_raw.bcf -f raw_data/genomas_reformateados/Trichoderma_guizhouense_NJAU_4742.fa outputs/results/bam/T9_guizhouense.aligned.sorted.bam

echo "Running bcftools call..."
bcftools call --ploidy 1 -m -v -o outputs/results/vcf/T9_guizhouense_variants.vcf outputs/results/bcf/T9_guizhouense_raw.bcf

# Step 5: Variant filtering
echo "Filtering variants..."
vcfutils.pl varFilter outputs/results/vcf/T9_guizhouense_variants.vcf > outputs/results/vcf/T9_guizhouense_final_variants.vcf

echo "Pipeline completed successfully!"

____________________

Th6
#Assuming FastQC and Trimmomatic steps are not necessary 

cd /home/garciav/Desktop/Trichoderma

# Step 1: Alignment
echo “Indexing reference genome…”
bwa index raw_data/genomas_reformateados/Trichoderma_afroharzianum_Th6.fa

echo "Running BWA MEM for alignment..."
bwa mem raw_data/genomas_reformateados/Trichoderma_afroharzianum_Th6.fa raw_data/T9/T9_S50_R1.trim.fastq.gz raw_data/T9/T9_S50_R2.trim.fastq.gz > outputs/results/sam/T9_afroTh6.aligned.sam

# Step 2: SAM to BAM conversion
echo "Converting SAM to BAM..."
samtools view -S -b outputs/results/sam/T9_afroTh6.aligned.sam > outputs/results/bam/T9_afroTh6.aligned.bam

# Step 3: Sorting BAM file
echo "Sorting BAM file..."
samtools sort -o outputs/results/bam/T9_afroTh6.aligned.sorted.bam outputs/results/bam/T9_afroTh6.aligned.bam

# Step 4: Variant calling
echo "Running bcftools mpileup..."
bcftools mpileup -O b -o outputs/results/bcf/T9_afroTh6_raw.bcf -f raw_data/genomas_reformateados/Trichoderma_afroharzianum_Th6.fa outputs/results/bam/T9_afroTh6.aligned.sorted.bam

echo "Running bcftools call..."
bcftools call --ploidy 1 -m -v -o outputs/results/vcf/T9_afroTh6_variants.vcf outputs/results/bcf/T9_afroTh6_raw.bcf

# Step 5: Variant filtering
echo "Filtering variants..."
vcfutils.pl varFilter outputs/results/vcf/T9_afroTh6_variants.vcf > outputs/results/vcf/T9_afroTh6_final_variants.vcf

echo "Pipeline completed successfully!"

