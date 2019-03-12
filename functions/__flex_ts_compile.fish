function __flex_ts_compile
	set base_location ~/PycharmProjects/devenv/flex-base/neoflex/
	cd $base_location
	while true;
	    inotifywait -q -e modify djflex/customercenter/static/customercenter/base.ts --format "%w/%f" 
		    echo -en "\e[1A"; echo -e "\e[0K\r   - "(date "+%T")" - Filed modified"
            if fab compile_js >/dev/null
                echo -en "\e[1A"; echo -e '\e[0K\r   - '(date "+%T")' - '(set_color green)'Suceeded'(set_color normal)' Compiling'
            else
                echo -en "\e[1A"; echo -e '\e[0K\r   - '(date "+%T")' - '(set_color red)'Failed'(set_color normal)' Compiling'
            end
    end
end
