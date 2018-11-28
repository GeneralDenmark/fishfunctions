function countdocker
	echo (docker ps | grep $argv | grep -v 'CONTAINER ID' | wc -l)
end
