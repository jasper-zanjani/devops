# Create a standard cluster with one node
gcloud container clusters create hello-cluster --num-nodes=1

# Confirm
gcloud compute instances list

# If a default zone is not set, region must be explicitly specified.
gcloud container clusters create-auto hello-cluster

# Confirm
gcloud container clusters describe hello-cluster
