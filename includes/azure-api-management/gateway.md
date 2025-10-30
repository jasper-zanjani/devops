The API management [**gateway**](https://learn.microsoft.com/en-us/azure/api-management/api-management-gateways-overview) (also data plane or runtime) is the service component responsible for proxying API requests, applying policies, and collecting telemetry.
All requests from client applications first reach the API gateway, which acts as a frontend routing API calls to backend services.
The gateway verifies API keys and other credentials, enforces usage quotas and rate limits, optionally transforms requests and responses per policy documents, and can even cache responses to improve response latency and minimize load on backend services.


