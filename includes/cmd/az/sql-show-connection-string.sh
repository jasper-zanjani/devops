# Generate a connection string based on given parameters (caution: no validation with Azure is performed)
# - client connection provider can be one of: ado.net, jdbc, odbc, php, php_pdo, or sqlcmd.
az sql db show-connection-string --name $DB_NAME --server $DB_SERVER_FQDN \
    --client $CLIENT_CONN_PROVIDER
