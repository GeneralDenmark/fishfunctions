# Defined in /tmp/fish.8xN6pw/rdp.fish @ line 2
function rdp
	set -l options 'h/help' 'c/consignor' 'l/labtop' 'u-user=+' 'w-width=+' 'e-height=+' 'o-nofonts' 'a-wallpaper' 'b-noclipboard' 'x/exag=+'
	argparse $options -- $argv ^/dev/null;
	or begin 
	echo "Some arguments [" $argv "] was not understood" 
	and rdp.help
	and return 1
	end
	
	if set -q _flag_h;rdp.help;return 0;end
	if set -q _flag_c;set connect 'consignor-v01.ao-vvs.dk'; set ex_args '';else if set -q _flag_l;set connect 'CLE5570-03669';end
	if set -q _flag_nofonts;set fonts '-fonts';else;set fonts '+fonts';end
	if set -q _flag_wallpaper;set wallpaper '+wallpaper';else;set wallpaper '-wallpaper';end
	if set -q _flag_noclipboard;set clipboard '-clipboard';else;set clipboard '+clipboard';end
	if set -q _flag_user;set user $_flag_user;else;set user 'agw';end
	if set -q _flag_height;set height $_flag_height;else;set height 1918;end
	if set -q _flag_width;set width $_flag_width;else;set width 1180;end
	if set -q _flag_exag;set ex_args $ex_args $_flag_exag;end
	echo $ex_args
	if set -q connect
		command xfreerdp /u:$user /p:(zenity --password) /size:$height"x"$width /v:$connect $fonts $wallpaper $clipboard $ex_args
	else 
		echo 'You need to specify what you wanna connect to budd'
	end
end
