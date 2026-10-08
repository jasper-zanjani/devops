# Display information on Machine Configuration resource extensions 
az vm extension list-names -l eastus -p Microsoft.GuestConfiguration

# Install Machine Configuration extension on a Linux VM
az vm extension set \
  -n "ConfigurationForLinux" -p "Microsoft.GuestConfiguration" \
  --ids "/subscriptions/▒▓▒▓▒░▓▓-▓▒░▒-▒▓▒░-▒▒▒░-░▒▓▒▒▒/resourceGroups/░▒▓░▓▓▒▓/providers/Microsoft.Compute/virtualMachines/▒▒░▒░▓▓░▓░" 
