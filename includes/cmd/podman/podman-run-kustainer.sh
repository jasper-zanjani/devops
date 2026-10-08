# Run the Azure Data Explorer Kusto emulator. Note the environment variable needed.
podman run -v $HOME/kustodata:/kustodata -e ACCEPT_EULA=Y -p 8080:8080 kustainer-linux
