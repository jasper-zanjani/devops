# Accepts JMESPATH queries
az pipelines runs list --query '[*].result'

az pipelines run --id 1 --parameters "name=$NAME pool=$POOL"

az pipelines delete --id 1
