## CARET = Classification And REgression Tree
## Supervised Learning = Prediction
library(caret)
library(tidyverse)

# 1. split data
set.seed(42)
splitData <- train_test_split(mtcars, 0.7)
train_data <- splitData[[1]]
test_data <- splitData[[2]]]

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
