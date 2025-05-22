#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Get username
echo "Enter your username:"
read USERNAME

# Get user info from database
USER_INFO=$($PSQL "SELECT games_played, best_game FROM guessing_game WHERE username='$USERNAME'")

if [[ -z $USER_INFO ]]
then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert new user
  INSERT_RESULT=$($PSQL "INSERT INTO guessing_game(username) VALUES('$USERNAME')")
  GAMES_PLAYED=0
  BEST_GAME=0
else
  # Existing user - extract stats
  IFS='|' read -r GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate random number between 1-1000
SECRET_NUMBER=$((1 + RANDOM % 1000))
GUESS_COUNT=0

echo "Guess the secret number between 1 and 1000:"

while true
do
  read USER_GUESS

  # Validate input is an integer
  if [[ ! "$USER_GUESS" =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESS_COUNT++))

  if (( USER_GUESS > SECRET_NUMBER ))
  then
    echo "It's lower than that, guess again:"
  elif (( USER_GUESS < SECRET_NUMBER ))
  then
    echo "It's higher than that, guess again:"
  else
    # Correct guess - update game stats
    ((GAMES_PLAYED++))
    
    # Update best game if this was better or first game
    if (( BEST_GAME == 0 )) || (( GUESS_COUNT < BEST_GAME ))
    then
      BEST_GAME=$GUESS_COUNT
    fi
    
    # Update database
    UPDATE_RESULT=$($PSQL "UPDATE guessing_game SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME'")
    
    # Print success message with exact required format
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done