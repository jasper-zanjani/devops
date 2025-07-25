az ad sp create-for-rbac \
    --role="Contributor" \
    --scopes="/subscriptions/▒▓░▒▓░▒░-▒░░▒-▓▒░▒-▒▓▓░-▒▓░▒▒░▒▓░▓▓░" # (1)

az ad sp show --id "░▓▓▒░░▓▓-░░▓▓-▒░░▒-▒▒░▓-▓▒▓▓░░░▒▒░░▒"

az ad sp delete --id "░▓▓▒░░▓▓-░░▓▓-▒░░▒-▒▒░▓-▓▒▓▓░░░▒▒░░▒"
