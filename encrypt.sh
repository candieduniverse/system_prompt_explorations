#!/bin/bash

# Simple encryption script for global rules
# Uses OpenSSL for encryption with AES-256-CBC

echo "Encrypting protected/ directory..."

# Check if password file exists
if [ -f ".password" ]; then
    # Get password from file
    PASSWORD=$(cat .password)
    echo "Using password from .password file"
else
    # Ask for password if file doesn't exist
    echo "Password file not found. Please enter a password for encryption:"
    read -s PASSWORD
    echo "Confirm password:"
    read -s PASSWORD_CONFIRM

    if [ "$PASSWORD" != "$PASSWORD_CONFIRM" ]; then
        echo "Passwords do not match. Exiting."
        exit 1
    fi

    # Confirm if user wants to save the password
    echo "Would you like to save this password for future use? (y/n)"
    read SAVE_RESPONSE

    if [[ "$SAVE_RESPONSE" == "y" || "$SAVE_RESPONSE" == "Y" ]]; then
        echo "$PASSWORD" > .password
        echo "Password saved to .password"
    fi
fi

if [ ! -d "protected/" ]; then
    echo "Error: The protected/ directory does not exist."
    exit 1
fi

# Create a zip file of all files in the protected directory, excluding .password
cd ./protected/
zip -r ../protected.zip ./*
cd ..

# Encrypt the zip file using the password from file with improved key derivation
openssl enc -aes-256-cbc -salt -pbkdf2 -iter 10000 -in protected.zip -out protected.zip.enc -pass pass:"$PASSWORD"

# Clean up the temporary zip file
rm protected.zip

echo "Encryption complete! File saved as protected.zip.enc"
echo "Use decrypt.sh with the same password to decrypt."
