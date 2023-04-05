num <- 1:3
menu <- c("Otoro sushi", "Salmon sushi", "Special sushi")
price <- c(80, 40, 120)
df_menu <- data.frame(num, menu, price)

chatbot <- function() {
  print("Welcome to Sushi Online!")
  print("I'm AI Salmon at your service!")
  
  print("Note: If you want to exit please type 0.")
  while(TRUE) {
    cat("What's your name?")
    user_name <- readLines("stdin", 1)
    if (user_name == 0) {
      print("Thank you for coming. Hope to see you again soon!")
      break
    } else {
      print(paste("Hello!", user_name, "Nice to meet you!"))
      cat("May I have your phone number please?")
      user_phone <- readLines("stdin", 1)
      
      print("type 1: I would like to order sushi!")
      print("type 2: I would like to check my order status.")
      print("type 3: I would like to cancel my order.")
      cat("What can I do for you today?")
      user_select <- readLines("stdin", 1)
      if (user_select == 1) {
        print("type 1 for Otoro sushi")
        print("type 2 for Salmon sushi")
        print("type 3 for Special sushi")

        cat("Which one would you like to order?")
        user_sushi <- readLines("stdin", 1)
        user_sushi <- as.numeric(user_sushi)

        cat("How many would you like to order?")
        user_sushiq <- readLines("stdin", 1)
        user_sushiq <- as.numeric(user_sushiq)
        print(paste("We have received you order! Thank you for ordering",user_sushiq, df_menu[[2]][user_sushi], "(s) for a total of", df_menu[[3]][user_sushi] * user_sushiq, "Baht"))
        print("Your order will be ready soon!")
        break
      } else if (user_select == 2) {
        print(paste(user_name, "'s order is in the kitchen. It will be ready soon!"))
        break
      } else if (user_select == 3) {
        print(paste("Your order has been cancelled."))
        break
      }
    } 
  } 
}

chatbot()
