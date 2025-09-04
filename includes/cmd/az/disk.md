```sh
DISK_ID="/subscriptions/▒▓░▒░▒▒▓-░▒▒▒-▒▓░░-░▓▓▓-▒░▒▓░▒/resourceGroups/░░░▓▓▒▒░/providers/Microsoft.Compute/disks/░░▒░▓▒░▓▓▓▒▓"
az disk show --ids $DISK_ID

az disk update --ids $DISK_ID --size-gb 256
```
