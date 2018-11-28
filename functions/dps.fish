# Defined in - @ line 0
function dps --description alias\ dps\ docker\ ps\ --format\ \'\{\{.Names\}\}\'
	set tmp 'docker'
	if [ (countdocker '') != 1 ]
		set tmp $tmp's'
	end
	echo 'There is:' (countdocker '') $tmp
	docker ps --format '{{.Names}}'
end
