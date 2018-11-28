# Defined in - @ line 0
function restart_errythang --description 'alias restart_errythang docker-compose -f ~/PycharmProjects/devenv/docker-compose.yml restart; and bash ~/countdown.sh; and systemctl restart nginx; and echo "all done"'
	docker-compose -f ~/PycharmProjects/devenv/docker-compose.yml restart; and bash ~/countdown.sh; and systemctl restart nginx; and echo "all done" $argv;
end
