# Packages required
require(MASS)

# Load the Auto MPG dataset
auto <- read.csv(
  "https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data",
  header = FALSE,
  sep = "",   # whitespace-separated file
  col.names = c("mpg", "cylinders", "displacement", "horsepower",
                "weight", "acceleration", "model_year", "origin", "car_name"),
  na.strings = "?"
)

auto <- na.omit(auto)

Y <- matrix(auto$mpg, ncol = 1)

Xpreds <- auto[, c("displacement", "horsepower", "weight", "acceleration")]

X <- as.matrix(cbind(1, scale(Xpreds)))

n <- nrow(X)