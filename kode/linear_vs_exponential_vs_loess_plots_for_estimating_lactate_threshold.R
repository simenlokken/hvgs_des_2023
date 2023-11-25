## Lin, exp and LOESS functions for est. lactate threshold

# Load packages

# Tibble from example lactate threshold test

df <- tibble(
  fart = c(9, 10, 11, 12, 13, 14, 15),
  laktat = c(1.6, 1.7, 1.9, 2.3, 2.9, 3.2, 6.10))

# Linear model

lin_model <- lm(laktat ~ fart, data = df)

summary(lin_model)

# Exponential model

exp_model <- lm(log(laktat) ~ fart, data = df)

summary(exp_model)

# Linear function for est. lactate threshold

lin_plot <- df |> 
  ggplot(aes(x = fart, y = laktat)) +
  geom_point() +
  geom_smooth(method = "lm",
              se = F, 
              aes(color = "Lineær")) +
  scale_color_manual(name = "Funksjon",
                     values = c("Lineær" = "#037bfc")
  ) +
  theme_light() +
  labs(title = "Matematiske funksjoner for estimering av laktatterskel",
       subtitle = "Laktatterskel = 3.2 mmol/L"
  ) +
  scale_y_continuous(
    name = "Laktat (mmol/L)",
    limits = c(0, 7),
    breaks = seq(0, 7, by = 1)
  ) +
  scale_x_continuous(
    name = "Fart (km/t)",
    limits = c(9, 15),
    breaks = seq(9, 15, by = 0.5)
  ) +
  theme(panel.grid.minor = element_blank())


ggsave(plot = lin_plot,
       path = "grafer/",
       filename = "lin_plot_for_estimating_threshold.jpg",
       dpi = 300,
       height = 4,
       width = 8
       )

## Exponential function for est. lactate threshold

exp_plot <- df |> 
  ggplot(aes(x = fart, y = laktat)) +
  geom_point() +
  geom_line(aes(y = exp(predict(exp_model)),
                color = "Eksponentiell")) +
  scale_color_manual(name = "Funksjon",
                     values = c("Eksponentiell" = "#fc0320")) +
  theme_light() +
  labs(title = "Matematiske funksjoner for estimering av laktatterskel",
       subtitle = "Laktatterskel = 3.2 mmol/L"
  ) +
  scale_y_continuous(
    name = "Laktat (mmol/L)",
    limits = c(0, 7),
    breaks = seq(0, 7, by = 1)
  ) +
  scale_x_continuous(
    name = "Fart (km/t)",
    limits = c(9, 15),
    breaks = seq(9, 15, by = 0.5)
  ) +
  theme(panel.grid.minor = element_blank())

ggsave(plot = exp_plot,
       path = "grafer/",
       filename = "exp_plot_for_estimating_threshold.jpg",
       dpi = 300,
       height = 4,
       width = 8)

## LOESS function for est. lactate threshold

loess_plot <- df |> 
  ggplot(aes(x = fart, y = laktat)) +
  geom_point() +
  geom_smooth(se = F, aes(color = "LOESS")) +
  scale_color_manual(name = "Funksjon",
                     values = c("LOESS" = "#fcb103")
  ) +
  theme_light() +
  labs(title = "Matematiske funksjoner for estimering av laktatterskel",
       subtitle = "Laktatterskel = 3.2 mmol/L"
  ) +
  scale_y_continuous(
    name = "Laktat (mmol/L)",
    limits = c(0, 7),
    breaks = seq(0, 7, by = 1)
  ) +
  scale_x_continuous(
    name = "Fart (km/t)",
    limits = c(9, 15),
    breaks = seq(9, 15, by = 0.5)
  ) +
  theme(panel.grid.minor = element_blank())

ggsave(plot = loess_plot,
       path = "grafer/",
       filename = "loess_plot_for_estimating_threshold.jpg",
       dpi = 300,
       height = 4,
       width = 8)

# Plot of lin, exp and LOESS function

exp_lin_loess_plot <- df |> 
  ggplot(aes(x = fart, y = laktat)) +
  geom_point() +
  geom_smooth(method = "lm",
              se = F,
              aes(color = "Lineær")) +
  geom_line(aes(y = exp(predict(exp_model)),
                color = "Eksponentiell")) +
  
  geom_smooth(se = F, aes(color = "LOESS")) +
  scale_color_manual(name = "Funksjon",
                     values = c("Lineær" = "#037bfc",
                                "Eksponentiell" = "#fc0320",
                                "LOESS" = "#fcb103")
  ) +
  theme_light() +
  labs(title = "Matematiske funksjoner for estimering av laktatterskel",
       subtitle = "Laktatterskel = 3.2 mmol/L"
  ) +
  scale_y_continuous(
    name = "Laktat (mmol/L)",
    limits = c(0, 7),
    breaks = seq(0, 7, by = 1)
  ) +
  scale_x_continuous(
    name = "Fart (km/t)",
    limits = c(9, 15),
    breaks = seq(9, 15, by = 0.5)
  ) +
  theme(panel.grid.minor = element_blank())

ggsave(plot = exp_lin_loess_plot,
       path = "grafer/",
       filename = "lin_exp_loess_plots_for_estimating_thresholds.jpg",
       dpi = 300,
       height = 4,
       width = 8)
