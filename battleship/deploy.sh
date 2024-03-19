# #!/bin/bash

API="https://api.explorer.aleo.org/v1"
BROADCAST="testnet3/transaction/broadcast"
APPNAME="battleship"
PRIVATE_KEY=$(grep "PRIVATE_KEY" $ENV_FILE | cut -d '=' -f2)


snarkos developer deploy "${APPNAME}.aleo" --private-key  --query "https://api.explorer.aleo.org/v1" --path "build/" --broadcast "https://api.explorer.aleo.org/v1/testnet3/transaction/broadcast" --priority-fee 1000000 

