# IOT DASHBOARD SERVICES
This repo holds the configuration for running mongo, emqx and the IoT dashboard in a server using docker containers.

## Requirements
- docker (and docker compose)

## Build
### For local development
1. Clone both repositories (iot_dashboard and iot_dashboard_services)
2. Create .env file. A template is shown in `env-dev`
> [!NOTE]  
> Environment variables must match with the dashboard.
3. Run the services (mongo and emqx):
```
docker compose up -d
```
4. Check emqx service by connecting to the dashboard on [http://localhost:18083](http://localhost:18083)
5. Once services are running you can launch the dashboard application.

