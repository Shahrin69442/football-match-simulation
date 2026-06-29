# 
# PROJECT TITLE: Predictive Analytics in Sports: A Monte Carlo Simulation of Match Outcomes
# CASE STUDY   : Brazil vs Japan International Match Modeling
# PREPARED BY  : Md Shahrin Parvez
# METHODOLOGY  : Stochastic Poisson Goal Distribution
# 

library(ggplot2)

lambda_brazil <- 1.65  
lambda_japan  <- 0.75  

set.seed(42)            
n_simulations <- 10000  

brazil_goals <- rpois(n_simulations, lambda_brazil)
japan_goals  <- rpois(n_simulations, lambda_japan)

match_results <- ifelse(brazil_goals > japan_goals, "Brazil Wins",
                        ifelse(brazil_goals < japan_goals, "Japan Wins", "Draw (Extra Time)"))

sim_output <- as.data.frame(table(match_results))
colnames(sim_output) <- c("Outcome", "Frequency")
sim_output$Percentage <- (sim_output$Frequency / n_simulations) * 100

print(sim_output)

ggplot(sim_output, aes(x = Outcome, y = Percentage, fill = Outcome)) +
  geom_bar(stat = "identity", width = 0.5, color = "black", alpha = 0.85) +
  geom_text(aes(label = paste0(round(Percentage, 1), "%")), vjust = -0.5, fontface = "bold", size = 4.5) +
  scale_fill_manual(values = c("Draw (Extra Time)" = "#95a5a6", "Japan Wins" = "#e74c3c", "Brazil Wins" = "#2ecc71")) +
  ylim(0, 70) +
  theme_minimal() +
  labs(
    title = "Monte Carlo Simulation: Brazil vs Japan Predictive Modeling",
    subtitle = "Simulated 10,000 Matches Using Adjusted Poisson Goal Distributions",
    caption = "Project Lead: Md Shahrin Parvez | Methodology: Predictive Sports Analytics",
    x = "Match Outcome",
    y = "Probability (%)",
    fill = "Outcome"
  ) +
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    plot.subtitle = element_text(size = 11, hjust = 0.5, face = "italic"),
    plot.caption = element_text(size = 10, face = "bold.italic", color = "#2c3e50", hjust = 1),
    axis.title = element_text(face = "bold", size = 11),
    axis.text = element_text(size = 10, face = "bold"),
    panel.grid.major.x = element_blank(),
    legend.position = "none"
  )