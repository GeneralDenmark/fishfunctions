function zenity
	export DISPLAY=:0
	command zenity $argv 2>/dev/null
end
