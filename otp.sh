#!/bin/bash

# Prompt the user for OTP length
echo "Enter the OTP length (4 or 6):"
read length

# Function to generate a random OTP
generate_otp() {
  local otp_length=$1

  # Check if the entered length is valid
  if [[ $otp_length -ne 4 && $otp_length -ne 6 ]]; then
    echo "Error: Invalid input. Please enter 4 or 6."
    exit 1
  fi

  # Generate a random OTP using /dev/urandom and print it
  local otp=$(cat /dev/urandom | tr -dc '0-9' | fold -w $otp_length | head -n 1)
  echo "Generated OTP: $otp"
}

# Call the function with the user's input
generate_otp $length
