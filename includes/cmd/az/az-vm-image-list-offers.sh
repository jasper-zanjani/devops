# List VM image offers from Canonical
az vm image list-offers --location $LOCATION \
    --publisher "Canonical"

# List VM image offers from Red Hat
az vm image list-offers --location $LOCATION \
    --publisher "RedHat"

