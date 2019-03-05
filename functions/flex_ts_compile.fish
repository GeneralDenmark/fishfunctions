function flex_ts_compile
	set base_location ~/PycharmProjects/devenv/flex-base/neoflex/
	cd $base_location
	echo "Started listening on djflex/customercenter/static/customercenter/base.ts"
	while true;
		inotifywait -q -e modify djflex/customercenter/static/customercenter/base.ts --format "%w/%f" 
	    echo "Filed modifed"
	    fab -f $base_location"fabfile.py" compile_js
	    and echo (set color green)"Suceeded"(set color normal)" Compiling"
	    or echo (set color red)"Failed" (set color normal)" Compiling"
    end
end
