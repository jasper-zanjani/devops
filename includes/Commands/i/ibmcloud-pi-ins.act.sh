# Start a machine
ibmcloud pi ins act $INSTANCE_ID -o start

# Shut down a machine gracefully
ibmcloud pi ins act $INSTANCE_ID -o immediate-shutdown

# Stop a machine
ibmcloud pi ins act $INSTANCE_ID -o stop
