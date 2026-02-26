#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

OUTPUT_TEXT() {
  ELEMENT_TYPE=$($PSQL "SELECT types.type FROM types FULL JOIN properties ON types.type_id = properties.type_id WHERE atomic_number = $ELEMENT_NUMBER")
  ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ELEMENT_NUMBER")
  ELEMENT_MELT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ELEMENT_NUMBER")
  ELEMENT_BOIL=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ELEMENT_NUMBER")

  echo -e "The element with atomic number $ELEMENT_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELT celsius and a boiling point of $ELEMENT_BOIL celsius."
}

NO_FIND() {
  echo "I could not find that element in the database."
}

# if there is no argument given, leave message and end
if [[ -z "$1" ]]
then
  echo "Please provide an element as an argument."
else
  # find argument in tables, if number then look up in atomic_number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # TODO
    ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $1")

    if [[ -z $ELEMENT_SYMBOL ]]
    then 
      NO_FIND
    else
      ELEMENT_NUMBER=$1
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $1")

      OUTPUT_TEXT
    fi
  else
    # if two characters, look up in symbol
    arg="$1"
    if [[ ${#arg} -le 2 ]]
    then
      ELEMENT_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")

      if [[ -z $ELEMENT_NUMBER ]]
      then 
        NO_FIND
      else
        ELEMENT_SYMBOL=$1
        ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ELEMENT_NUMBER")

        OUTPUT_TEXT
      fi
    else
      # if number of character is equal or less than 40, look up via name 
      arg="$1"
      if [[ ${#arg} -le 40 ]]
      then
        ELEMENT_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
      
        if [[ -z $ELEMENT_NUMBER ]]
        then 
          NO_FIND
        else
          ELEMENT_NAME=$1
          ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$ELEMENT_NAME'")

          OUTPUT_TEXT
        fi
      else
        NO_FIND
      fi
    fi
  fi
fi
