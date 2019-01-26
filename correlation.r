---
title: "Correlation"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
if(!require("openintro")){
  install.packages("openintro")
  library(openintro)
}
library(ggplot2)
data(ncbirths)
data(mammals)
library(dplyr)
```

## R Markdown

Practice on correlation example

```{r ncbirths}
summary(ncbirths)
```

## Including Plots


```{r scatter, echo=FALSE}
ggplot(data = ncbirths, 
       aes(x = cut(weeks, breaks = 5), y = weight)) + 
  geom_boxplot()
```

## R Markdown

Difference in log10 call to graph
```{r}
# Scatterplot with coord_trans()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() + 
  coord_trans(x = "log10", y = "log10")

# Scatterplot with scale_x_log10() and scale_y_log10()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() +
  scale_x_log10() + scale_y_log10()
```
```{r}
# Compute correlation
ncbirths %>%
  summarize(N = n(), r = cor(weight, mage))

# Compute correlation for all non-missing pairs
ncbirths %>%
  summarize(N = n(), r = cor(weight, weeks, use = "pairwise.complete.obs"))
```
```{r}
# Scatterplot with coord_trans()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() + 
  geom_smooth(method = "lm",se=FALSE)
```

