play_game <- function() {
  user_score <- 0
  comp_score <- 0
  round <- 0
  
  print("Please choose one of these to start playing")
  print("H: Hammer, S:Scissor, P:Paper")
  print("If you want to exit game, please type E")
  while (TRUE) {
  cat("Choose your choice !")
  user_select <- readLines("stdin", 1)
    if (user_select == 'E') {
        print("See you then, Bye.")
        break
    } else {
      computer_select <- sample(c("H","S","P"), 1)
      if (user_select == computer_select) {
        print(paste("You:", user_select, "vs Comp:", computer_select))
        print("tie!")
        round <- round + 1
      } else if ((user_select == "H" & computer_select == "S")|(user_select == "S" & computer_select == "P")|(user_select == "P" & computer_select == "H")) {
        print(paste("You:", user_select, "vs Comp:", computer_select))
        print("You win!")
        user_score <- user_score + 1
        round <- round + 1
      } else if ((user_select == "H" & computer_select == "P")|(user_select == "S" & computer_select == "H")|(user_select == "P" & computer_select == "S")) {
        print(paste("You:", user_select, "vs Comp:", computer_select))
        print("You lose! Better luck next round!")
        comp_score <- comp_score + 1
        round <- round + 1
      }
    }
  }
  print("Thank you for playing with me.")
  print("Here is summary of our game!")
  print(paste("We have played for", round, "round(s)!"))
  print(paste("You won", user_score, "!! Wow! That's amazing!"))
  print(paste("Computer won", comp_score))
}

play_game()
