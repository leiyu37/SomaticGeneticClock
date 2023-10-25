#!/usr/bin/env Rscript
library(ggplot2)

obj <- read.table("./combine.txt", header = TRUE)

pdf("NSH_SH.pdf", width = 4, height = 4)
ggplot(obj, aes(NSH, SH)) +
  geom_point(shape = 4) +
  geom_hline(yintercept = 0.9, color = "orange") +
  theme_classic() +
  ylab("SH") +
  xlab("NSH") +
  scale_x_continuous(limits = c(0, max(obj$NSH) +1), labels=function(x) format(x, big.mark = ",", scientific = FALSE)) +
  scale_y_continuous(limits = c(0,1), breaks = c(0, 0.25, 0.50, 0.75, 0.90, 1)) +
  theme(legend.position = "none")

dev.off()


pdf("SH_histogram.pdf", width = 4, height = 4)
ggplot(obj, aes(SH)) +
  geom_histogram(binwidth = 0.01) +
  geom_vline(xintercept = 0.90, color = "orange") +
  theme_classic() +
  xlab("SH") +
  scale_y_continuous(labels=function(x) format(x, big.mark = ",", scientific = FALSE)) +
  scale_x_continuous(limits = c(0,1), breaks = c(0, 0.25, 0.50, 0.75, 0.90, 1))
dev.off()

obj01 <- subset(obj, SH > 0.9)


write.table(obj01, file = "00_cloneSH.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)
