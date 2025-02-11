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

### Production
For deploying the services including the web application to a Linux server (Ubuntu) you can follow this steps:
1. Install docker and git on the server. A helper script is provided for installing docker.
```sh
sudo apt update
sudo apt install -y git

# From https://docs.docker.com/engine/install/ubuntu/
# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install latest version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
2. Clone both repositories [IoT Dashboard Services](https://github.com/marcosraimondi1/iot_dashboard_services) and [IoT Dashboard App](https://github.com/marcosraimondi1/iot_dashboard)
```sh
git clone https://github.com/marcosraimondi1/iot_dashboard_services.git services
cd services
git clone https://github.com/marcosraimondi1/iot_dashboard.git app
```
3. Set up all environment variables (for services and for the web application)
```sh
cp env-dev .env # edit accordingly
cp app/env-dev app/.env # edit accordingly
```
4. Build web app
```sh
cd app
npm run install
npm run build
```
5. Run the containers for prodcution
```sh
sudo docker compose -f docker-compose-production.yml up -d
```

> [!NOTE]  
> Create firewall rules to accept traffic for web and services ports.
