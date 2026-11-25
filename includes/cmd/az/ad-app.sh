# Generate a new secret
az ad app credential reset \
    --id "▓▓▓▒▒▒▒░-░▓░▒-▒░▒▓-▒▓░▓-▒▒▒░▒▒" --append \
    --display-name $SECRET_NAME \
    --years 1
