#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo -e "\n~~ Number Guessing Game ~~\n"
# $($PSQL "")

echo -e "Enter your username:\n"
read USER
USERRES=$($PSQL "SELECT username FROM users WHERE username = '$USER'")
#check user existence
if [[ -z $USERRES ]]
then
  USERINSERTRES=$($PSQL "INSERT INTO users(username) VALUES ('$USER');")
  echo "Welcome, $USER! It looks like this is your first time here."
  read USERID <<< $($PSQL "SELECT userid FROM users WHERE username = '$USER'")
else
  read USERID <<< $($PSQL "SELECT userid FROM users WHERE username = '$USER'")
  read GAMES <<< $($PSQL "SELECT COUNT(gameid) FROM games WHERE userid = $USERID")
  read BEST <<< $($PSQL "SELECT MIN(guesses) FROM games WHERE userid = $USERID")
  echo "Welcome back, $USER! You have played $GAMES games, and your best game took $BEST guesses."
fi

#random number
RAN=$((RANDOM % 1000 + 1)) 
echo -e "\nGuess the secret number between 1 and 1000:\n"
TRIES=0
while true
do
  read GUESS
  if [[ ! $GUESS =~ ^-?[0-9]+$ ]]
  then 
    echo -e "\nThat is not an integer, guess again:\n"
    continue
  fi

  if [[ $GUESS -gt $RAN ]]
  then
    echo -e "\nIt's lower than that, guess again:\n"
    ((TRIES++))
    continue
  elif [[ $GUESS -lt $RAN ]]
  then
    echo -e "\nIt's higher than that, guess again:\n"
    ((TRIES++))
    continue
  else
    ((TRIES++))
    echo -e "\nYou guessed it in $TRIES tries. The secret number was $RAN. Nice job!\n"
    break
  fi
done

INSERTGAMES=$($PSQL "INSERT INTO games(userid, guesses) VALUES($USERID, $TRIES);")