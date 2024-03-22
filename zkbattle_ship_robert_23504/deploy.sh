# #!/bin/bash

APPNAME="zkbattle_ship_robert_23504"
ENV_FILE=".env" 
PRIVATE_KEY=$(grep "PRIVATE_KEY" $ENV_FILE | cut -d '=' -f2)


snarkos developer deploy "${APPNAME}.aleo" --path "./build/" --private-key "${PRIVATE_KEY}" --query "https://api.explorer.aleo.org/v1" --priority-fee 9000000 --broadcast "https://api.explorer.aleo.org/v1/testnet3/transaction/broadcast" \
