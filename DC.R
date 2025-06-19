library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)



df=read.csv("C:/Users/jonba/Downloads/water-quality-data.csv")

vis_miss(df,warn_large_data = FALSE)

df_sample <- df[sample(1:nrow(df), size = 10000), ]
df_2 <- kNN(df_sample, 
            variable = c("Value", "MDL", "RDL"), 
            dist_var = c("Area", "Site.Type"), 
            k = 5, 
            imp_var = FALSE)
vis_miss(df_2)

write.csv(df_2, "DF_DC_na.csv")


