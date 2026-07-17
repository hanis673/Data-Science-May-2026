# Question 2(a)
# Multiple Linear Regression

# Load built-in dataset

data(airquality)

# Remove missing values
airquality <- na.omit(airquality)

# Display first few rows
head(airquality)

# Display data structure
str(airquality)

# Select required variables only

data2 <- data.frame(
  Ozone = airquality$Ozone,
  Solar.R = airquality$Solar.R,
  Wind = airquality$Wind,
  Temp = airquality$Temp
)

head(data2)

# Use approximately 70% for training

n <- nrow(data2)

train_size <- round(0.7 * n)

data2_train <- data2[1:train_size, ]

data2_test <- data2[(train_size + 1):n, ]

# Build Multiple Linear Regression model

relation2 <- lm(Ozone ~ Solar.R + Wind + Temp,
                data = data2_train)

# Display model summary
summary(relation2)

# Predict Ozone values

a <- data.frame(
  Solar.R = data2_test$Solar.R,
  Wind = data2_test$Wind,
  Temp = data2_test$Temp
)

result2 <- predict(relation2, a)

print(round(result2,2))

# Display actual and predicted values

prediction2 <- data.frame(
  Actual_Ozone = data2_test$Ozone,
  Predicted_Ozone = round(result2,2)
)

print(prediction2)
