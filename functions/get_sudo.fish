# Defined in /tmp/fish.bqrDsQ/get_sudo.fish @ line 2
function get_sudo
	zenity --password | sudo -S -v
    echo ""
end
