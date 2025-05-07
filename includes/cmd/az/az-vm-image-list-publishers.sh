# Exact string match
az vm image list-publishers --location $LOCATION \
    --query '[?name==`RedHat`]'

az vm image list-publishers --location $LOCATION \
    --query '[?contains(name, `RedHat`)]'
    
