# deploy containers
if [ $FIRST_DEPLOY ]; then
    echo "installing node_modules and building app"
    sudo docker-compose -f docker-compose-production.yml down
    sudo docker-compose -f docker_node_install.yml down
    sudo docker-compose -f docker_node_install.yml up && echo "starting server" && sudo docker-compose -f docker-compose-production.yml up -d
    sudo sh -c "echo FIRST_DEPLOY=false >> /etc/environment"
    source /etc/environment
else
    echo "starting server"
    sudo docker-compose -f docker-compose-production.yml build
    sudo docker-compose -f docker-compose-production.yml up -d
fi