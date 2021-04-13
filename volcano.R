# This is a simple script to generate a volcano plot

# Download the data we will use for plotting 
download.file("https://raw.githubusercontent.com/biocorecrg/CRG_RIntroduction/master/de_df_for_volcano.rds", "de_df_for_volcano.rds", method="curl")
# The RDS format is used to save a single R object to a file, and to restore it.
# Extract that object in the current session:
data <- readRDS("de_df_for_volcano.rds")

# remove rows that contain NA values
data_rm <- data[complete.cases(data), ]

# plot the data
plot (data_rm$log2FoldChange, -log10(data_rm$pvalue), 
      xlab = "Log2Fold Change", ylab = "-log10 P-value",
      col = ifelse((data_rm$log2FoldChange > 0.5| data_rm$log2FoldChange < -0.5) 
                   ,'red','blue'), pch = 19)
abline(h=5, col="blue")
