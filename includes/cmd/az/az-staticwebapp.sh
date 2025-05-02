# Create a static web app from a public repository
az staticwebapp create -s $REPO_URL \
    -n $APP_NAME -g $RG_NAME

# Specify a SKU (free is used by default)
az staticwebapp create -s $REPO_URL --sku Dedicated \
    -n $APP_NAME -g $RG_NAME

# Delete a static web app
az staticwebapp delete \
    -n $APP_NAME -g $RG_NAME
