# Show available contexts
kubectl config get-contexts

# Display current context
kubectl config current-context

# Switch to a different context
kubectl config use-context $NAMESPACE
kubectl config use $NAMESPACE