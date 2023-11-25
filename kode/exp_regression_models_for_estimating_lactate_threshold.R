# TEMA

# Denne fila viser hvordan eksponentielle regresjonsmodeller kan brukes for å estimere laktat som en funksjon av fart/watt

# LAST INN PAKKER

library(tidyverse)
library(patchwork)

df_full <- tibble( # Full data
  fart = c(9, 10, 11, 12, 13, 14, 15),
  laktat = c(1.6, 1.7, 1.9, 2.3, 2.9, 3.2, 6.10))

df_reduced <- tibble( # Reduced data
  fart = c(9, 10, 11, 12, 13, 14),
  laktat = c(1.6, 1.7, 1.9, 2.3, 2.9, 3.2))

# MODELLER

# Eksponentiell

exp_model_lt_reduced <- lm(log(laktat) ~ fart, data = df_reduced) # Reduced model

exp_function_lt_reduced <- function(x){ # Function for reduced data
  
  exp(coef(exp_model_lt_reduced)[1]) * exp(coef(exp_model_lt_reduced)[2])^x 
  
}

exp_function_lt_reduced(14) # Test function for reduced data

# PLOTT

# Full modell

full_plot <- df_full |> 
  ggplot(aes(fart, laktat)) +
  geom_point() +
  geom_line(aes(y = exp(predict(exp_model_lt_full)),
                color = "red"), show.legend = F) +
  scale_y_continuous(
    name = "Laktat (mmol/L)",
    breaks = seq(0, 6, 1)
  ) +
  scale_x_continuous(
    name = NULL,
    breaks = seq(9, 15, 1)
  ) +
  labs(title = "Eksponentiell model fra full laktattest") +
  theme_light() +
  theme(panel.grid.major = element_blank())

# Redusert modell

reduced_plot <- df_reduced |> 
  ggplot(aes(fart, laktat)) +
  geom_point() +
  geom_line(aes(y = exp(predict(exp_model_lt_reduced)),
                color = "red"), show.legend = F) +
  scale_y_continuous(
    name = "Laktat (mmol/L)",
    breaks = seq(0, 4, 0.25)
  ) +
  scale_x_continuous(
    name = "Fart (km/t)",
    breaks = seq(9, 15, 1)
  ) +
  labs(title = "Eksponentiell model fra modifisert laktattest") +
  theme_light() +
  theme(panel.grid.major = element_blank())

combined_plot <- full_plot / reduced_plot

# Lagre plott

setwd("C:/Users/simen/Desktop/hvgs_des_2023/grafer")

ggsave(plot = combined_plot,
       filename = "two_exp_reg_for_estimating_lactate_threshold.jpg",
       dpi = 300,
       height = 4,
       width = 8)