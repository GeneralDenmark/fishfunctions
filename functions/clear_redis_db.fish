function clear_redis_db
	for i in (seq 0 $argv)
		docker exec -it crawler_redis_1 redis-cli -n (math $argv-$i) flushdb >/dev/null 2>&1 &;echo "Clearing db "(math $argv-$i)
	end
	wait 
	echo "jobs done"
end
