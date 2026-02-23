#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c "
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then echo -e "\n$1"
  fi

  echo -e "1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    [1-5]) GET_INFO ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}
  
GET_INFO() {
  case $SERVICE_ID_SELECTED in
    1) SERVICE="cut" ;;
    2) SERVICE="color" ;;
    3) SERVICE="perm" ;;
    4) SERVICE="style" ;;
    5) SERVICE="trim" ;;
  esac

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # search for phone number in customers table
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # check if not exists
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # insert name, phone into customers table
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  echo -e "\nWhat time would you like your $SERVICE,$CUSTOMER_NAME?"
  read SERVICE_TIME

  # insert to appointments table
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

MAIN_MENU



