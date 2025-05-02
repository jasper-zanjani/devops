# Move a resource to another resource group or subscription 
az resource list -g ExamRefRG
az resource move --destination-group ExamRefDestRG --ids $resourceID
az resource move --destination-group ExamrefDestRG --destination-subscription-id $subscriptionID --ids $resourceID
