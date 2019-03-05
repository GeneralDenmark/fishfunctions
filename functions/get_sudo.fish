# Defined in - @ line 2
function get_sudo
	zenity --password | sudo -S -v
    echo ""
end
