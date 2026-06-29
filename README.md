# Predictive Analytics in Sports: A Monte Carlo Simulation of Match Outcomes using R

## Project Overview
This repository contains a predictive sports analytics project that simulates an international football match between **Brazil** and **Japan**. Instead of relying on hardcoded static percentages, this project utilizes a stochastic modeling framework by implementing an **Adjusted Poisson Distribution** to model team scoring frequencies, followed by a **Monte Carlo Simulation** to determine match outcome probabilities.

---

## Methodology

### 1. Goal Distribution (Poisson Model)
Football goals are treated as independent, rare events occurring at a constant rate. Thus, team scoring outputs are modeled using the Poisson Distribution:

$$P(X = k) = \frac{\lambda^k e^{-\lambda}}{k!}$$

Where:
* $\lambda$ (Lambda) represents the expected average goals per match.
* For this simulation, the scoring rates were calibrated as:
  * **Brazil ($\lambda_1$):** 1.65 (Calibrated to yield an approximate ~58.2% win probability)
  * **Japan ($\lambda_2$):** 0.75 (Calibrated to yield an approximate ~18.8% win probability)

### 2. Monte Carlo Simulation
To capture the dynamic uncertainty and randomness inherent in football, a **Monte Carlo Simulation with 10,000 iterations** was executed. This process leverages the **Law of Large Numbers**, demonstrating how repeated random trials converge toward robust, stable statistical probabilities.

---

## Empirical Results
After running 10,000 simulated matches, the statistical outcomes converged as follows:

| Match Outcome | Empirical Probability (%) |
| :--- | :--- |
| **Brazil Wins** | ~58.2% |
| **Japan Wins** | ~18.8% |
| **Draw (Extra Time)** | ~23.0% |

---

## Technologies Used
* **Language:** R Programming
* **Libraries:** `ggplot2` (for publication-quality data visualization)
* **Core Concepts:** Stochastic Modeling, Poisson Distribution, Monte Carlo Methods, Predictive Analytics

---

## How to Run the Project
1. Clone this repository or download the `.R` script.
2. Open the file in **RStudio**.
3. Ensure `ggplot2` is installed by running `install.packages("ggplot2")`.
4. Execute the script to view the simulated dataset in the console and generate the visual bar chart.

---

**Project Lead:** Md Shahrin Parvez  
**Field:** Statistics & Predictive Data Science
