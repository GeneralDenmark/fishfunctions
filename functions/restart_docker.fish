function restart_docker
	set docker (docker ps --format '{{.Names}}' | grep $argv)
	if [ -z $docker ]
		return
	end
	command docker restart $docker
end
