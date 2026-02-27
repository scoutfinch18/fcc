#!/bin/bash
# script for generating a random number for users to guess
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GAME() {
  # increment counter
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
  read GUESS

  # if not integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    GAME
  else
    if [[ $SECRET_NUMBER -lt $GUESS ]]
    then
      echo "It's lower than that, guess again:"
      GAME
    else
      if [[ $SECRET_NUMBER -gt $GUESS ]]
      then
        echo "It's higher than that, guess again:"
        GAME
      else
        INSERT_GUESSES_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")

        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
      fi
    fi
  fi 
}

GET_NAME() {
  echo "Enter your username:"
  read USERNAME

  if [[ -z $USERNAME ]]
  then
    GET_NAME
  else
    arg=$USERNAME
    if [[ ${#arg} -gt 22 ]]
    then
      GET_NAME
    fi
  fi
}

MAIN() {
  GET_NAME   
    
  # initialize counter
  NUMBER_OF_GUESSES=0

  # generate random number
  MINIMUM=1
  MAXIMUM=1000
  SECRET_NUMBER=$(( RANDOM % (MAXIMUM - MINIMUM + 1) + MINIMUM ))

  # lookup username in table
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")

  if [[ -z $USER_ID ]]
  then
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")

    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id = $USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = $USER_ID")
    
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  echo "Guess the secret number between 1 and 1000:"
  GAME
}

MAIN