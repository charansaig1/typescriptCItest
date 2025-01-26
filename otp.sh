#!/bin/bash

# Generate a random 6-digit number (OTP)
otp=$(shuf -i 1000-9999 -n 1)

# Print the OTP
echo "Generated OTP: $otp"
