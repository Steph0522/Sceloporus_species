# Loading files
# "#DA5D11","#43B811","#F5A91D"

setwd("~/Documents/MICROBIOTA REPTILES/PAPERS 2021/Dry_aeneus_bica/Close_reference_SaSbSg/")
library(tidyverse)
library(ggplot2)
library(ggpubr)
library(dplyr)

# Create Venn Diagramm
library(VennDiagram)
library(ggVennDiagram)

# Core microbiota (60%)
aeneus_65 <- read.csv("core_65_aeneus.csv",
                      check.names = F) %>% rownames_to_column(
                        var = "ids")
bicanthalis_65 <- read.csv("core_65_bicanthalis.csv",
                           check.names = F) %>% rownames_to_column(
                             var = "ids") 
grammicus_65 <- read.csv("core_65_grammicus.csv",
                         check.names = F) %>% rownames_to_column(
                           var = "ids")

# Create Venn Diagramm

venn.plot_60 <- venn.diagram(
  x = list(S_aeneus = aeneus_65$OTUID,
           S_bicanthalis = bicanthalis_65$OTUID,
           S_grammicus = grammicus_65$OTUID),
  category.names = c(
    expression(bold("Sa")),
    expression(bold("Sb")),
    expression(bold("Sg"))),
  filename = "venn_all_species.tiff",
  output = TRUE,
  height = 3000,
  width = 3000,
  resolution = 300,
  compression = "lzw",
  units = "px",
  lwd = 6,
  lty = "blank",
  fill = c("green","red","orange"),
  cex = 1.5,
  fontface = "bold",
  fontfamily = "sans",
  cat.cex = 2,
  cat.fontface = "bold",
  cat.default.pos = "outer",
  # cat.pos = c(115, -125, -50),
  cat.dist = c(0.055, 0.055, 0.055),
  cat.fontfamily = "sans")
