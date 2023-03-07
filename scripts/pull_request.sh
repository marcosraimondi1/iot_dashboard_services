# pull git repositories

DIR=services
SERVICES=https://github.com/marcosraimondi1/iot_dashboard_services.git
APP=https://github.com/marcosraimondi1/iot_dashboard.git

# check if directory exists
if [ -d "~/$DIR" ];
then
    # pull repo 
    echo "pulling repo"
    cd "~/$DIR"
    sudo git pull
    cd ./app
    sudo git pull
else
    # clone repo
    cd ~
    echo "cloning repo"
    sudo git clone "$SERVICES" "$DIR"
    cd "$DIR"
    sudo git clone "$APP" app
fi

export FIRST_DEPLOY=true