# TEMA

# Denne fila illustrerer hvordan lineære og eksponentielle funksjoner ser ut

# LAST INN PAKKER

library(tidyverse)

# FUNKSJONER

x <- 1:10
df <- tibble(x)

# Lineær funksjon

lin_function <- function(x){
  
  10 + 2*x
  
}

# Eksponentiell funksjon

exp_function <- function(x){
  
  2 * 2^x
  
}

# PLOTT

# Lineært plott

lin_plot <- df |> 
  ggplot(aes(x = x)) +
  stat_function(fun = lin_function) +
  theme_light() +
  labs(title = "Lineær funksjon",
       x = NULL) +
  theme(panel.grid.minor = element_blank()) +
  scale_x_continuous(breaks = seq(0, 10, 1))

# Eksponentielt plott

exp_plot <- df |> 
  ggplot(aes(x = x)) +
  stat_function(fun = exp_function) +
  theme_light() +
  labs(title = "Eksponentialfunksjon",
       x = "x") +
  theme(panel.grid.minor = element_blank()) +
  scale_x_continuous(breaks = seq(0, 10, 1))

lin_plot / exp_plot

# Lagre plott

setwd("C:/Users/simen/Desktop/hvgs_des_2023/grafer")

ggsave(plot = lin_exp_plot, 
       filename = "lin_exp_plot.jpg",
       dpi = 300,
       height = 4,
       width = 7
)