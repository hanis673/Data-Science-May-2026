# Question 1(a)
# Simple Linear Regression

# Years of Experience (X)
experience <- 1:10
# Monthly Salary (Y)
salary <- c(2500,2700,3000,3400,3900,4400,5000,5600,6200,6900)

# Create dataframe
data1 <- data.frame(experience, salary)

# Display dataframe
print(data1)

# Split data into training (70%) and testing (30%)

data1_train <- data1[1:7, ]
data1_test <- data1[8:10, ]

print(data1_train)
print(data1_test)

# Build the Simple Linear Regression model

relation <- lm(salary ~ experience, data = data1_train)

# Display the regression model
print(relation)

# Predict salary for the testing dataset

x_test <- data.frame(experience = data1_test$experience)

result <- predict(relation, x_test)

print(result)

# Compare actual salary and predicted salary

prediction <- data.frame(
  Experience = data1_test$experience,
  Actual_Salary = data1_test$salary,
  Predicted_Salary = round(result,2)
)

print(prediction)


# Question 1(b)
# Scatter Plot with Regression Line

library(ggplot2)

ggplot(data1, aes(x = experience, y = salary)) +
  
  # Plot actual data
  geom_point(color = "blue", size = 3) +
  
  # Draw regression line
  geom_smooth(method = "lm",
              se = FALSE,
              color = "red") +
  
  labs(
    title = "Experience vs Monthly Salary",
    x = "Years of Experience",
    y = "Monthly Salary (RM)"
  ) +
  
  theme_minimal()



