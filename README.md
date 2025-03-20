# Exploring Successful System Prompts

This repository contains system prompts that attempt to approximate the behavior of agents in the wild.  This is intended as a learning exercise for understanding how agents work and how to write effective system prompts for my own features requiring agent-thinker functionality.

## What's Included

- **protected.zip.enc**: Encrypted archive containing explorations relating to system prompts
- **decrypt.sh**: Script to decrypt contents to protected/ directory
- **encrypt.sh**: Script to encrypt contents of protected/ directory


## Decryption Instructions

The rules are encrypted using OpenSSL for privacy. To decrypt:

### On macOS/Linux:
```bash
./decrypt.sh
# You'll be prompted for a password if none is saved
```

For convenience, you can save your password in a `.password` file in the project root. If this file exists, the scripts will use it automatically. If not, you'll be prompted to enter a password and given the option to save it for future use.
