function clear_redis_db
	for i in (seq 0 $argv)
echo 'flushing db id: '(math $argv - $i)
set answer (docker exec -it crawler_redis_1 redis-cli -n (math $argv - $i) flushdb) 
echo 'answer:' $answer
if [ -z $answer ]
echo 'Did not get the ok answer.'
echo 'Exit'
break
end
end
end
