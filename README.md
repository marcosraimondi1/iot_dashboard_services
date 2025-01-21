# IOT DASHBOARD SERVICES
This repo holds the configuration for running mongo, emqx and the IoT dashboard in a server using docker containers.

## Requirements
- docker (and docker compose)

## Build
### For local development
1. Clone both repositories (iot_dashboard and iot_dashboard_services)
2. Create .env file. A template is shown in `env-dev`.
> [!NOTE]  
> Environment variables must match with the backend environment variables (iot_dashboard/.env).
3. Run the services (mongo, mongo-express and emqx):
```
docker compose up -d
```
4. Check emqx service by opening emqx dashboard on [http://localhost:18083](http://localhost:18083)
5. Check mongo service by opening mongo-express on [http://localhost:8081](http://localhost:8081)
6. Once services are running you can launch the dashboard application.

