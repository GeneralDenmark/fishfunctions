# Defined in - @ line 0
function restart_errythang
	sudo -v	
	docker-compose -f ~/PycharmProjects/devenv/docker-compose.yml restart >/dev/null
	and sudo -v
	and countdown -s 5
	and systemctl restart nginx 
	and echo "all done" $argv
end
