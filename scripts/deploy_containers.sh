# deploy containers
if [ $FIRST_DEPLOY ]; then
    sudo docker-compose -f docker_node_install.yml up && sudo docker-compose -f docker-compose-production.yml up -d
else
    sudo docker-compose -f docker-compose-production.yml up -d
fi