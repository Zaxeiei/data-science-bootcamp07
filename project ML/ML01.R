## CARET = Classification And REgression Tree
## Supervised Learning = Prediction
library(caret)
library(tidyverse)

glimpse(mtcars)

# 1. split data 80%: 20%
set.seed(42)
n <- nrow(data)
id <- sample(1:n, size=0.8*n)
train_data <- data[id, ]
test_data <- data[-id, ]

# 2. train
ctrl <- trainControl(
  method = "cv",
  number = 5, # k=5
  verboseIter = TRUE
)
# use linear_regression model
lm_model <- train(mpg ~ hp + wt + am, 
                  data = train_data,
                  method = "lm", 
                  trControl = ctrl) 

# 3. score
p <- predict(model, newdata = test_data)

# 4. evaluate
rmse_metric(test_data$mpg, p)

# 5. save model
saveRDS(model, "linear_regression_v1.RDS")
