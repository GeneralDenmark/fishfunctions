# Defined in - @ line 0
function update --description 'alias update apt-get update -y; and apt-get upgrade -y'
	apt-get update -y; and apt-get upgrade -y $argv;
end
