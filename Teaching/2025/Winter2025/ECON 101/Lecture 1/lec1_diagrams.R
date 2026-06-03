# Load necessary libraries
library(ggplot2)

# 1. **Production Possibility Frontier (PPF)**
# Define the quantities of two goods (Good A and Good B)
good_A <- seq(0, 100, by=1)
good_B <- 100 - 0.5 * good_A  # A simple linear trade-off

# Create a data frame
ppf_data <- data.frame(good_A, good_B)

# Plot the PPF
ggplot(ppf_data, aes(x = good_A, y = good_B)) +
  geom_line(color = "blue", size = 1.5) +
  geom_point(aes(x = 50, y = 75), color = "red", size = 3) + # Example point on PPF
  ggtitle("Production Possibility Frontier (PPF)") +
  xlab("Good A") +
  ylab("Good B") +
  theme_minimal()

# 2. **Supply and Demand Diagram**
# Define a simple linear supply and demand
price <- seq(1, 10, by = 0.1)
demand <- 20 - 2 * price  # A simple demand curve (decreases with price)
supply <- 2 * price - 5   # A simple supply curve (increases with price)

# Create a data frame
supply_demand_data <- data.frame(price, demand, supply)

# Plot the supply and demand curves
ggplot(supply_demand_data, aes(x = price)) +
  geom_line(aes(y = demand), color = "red", size = 1.5, linetype = "dashed") +
  geom_line(aes(y = supply), color = "green", size = 1.5) +
  ggtitle("Supply and Demand") +
  xlab("Price") +
  ylab("Quantity") +
  theme_minimal() +
  scale_x_continuous(breaks = seq(1, 10, by = 1)) +
  scale_y_continuous(breaks = seq(0, 20, by = 5)) +
  theme(legend.position = "none") +
  annotate("text", x = 6, y = 4, label = "Equilibrium", color = "black", size = 4)

# 3. **Circular Flow of Income**
# Define simple circular flow data (households and firms)
households <- c(50, 40, 60, 70, 80)
firms <- c(40, 50, 60, 70, 90)
time_period <- 1:5

# Create a data frame
circular_flow_data <- data.frame(time_period, households, firms)

# Plot the circular flow of income
ggplot(circular_flow_data, aes(x = time_period)) +
  geom_line(aes(y = households), color = "blue", size = 1.5, linetype = "solid") +
  geom_line(aes(y = firms), color = "green", size = 1.5, linetype = "dotted") +
  ggtitle("Circular Flow of Income") +
  xlab("Time Period") +
  ylab("Income (in billions)") +
  theme_minimal() +
  theme(legend.position = "none") +
  annotate("text", x = 2, y = 70, label = "Households", color = "blue", size = 4) +
  annotate("text", x = 2, y = 50, label = "Firms", color = "green", size = 4)

