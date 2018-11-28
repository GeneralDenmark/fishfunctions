# Defined in - @ line 0
function postgres --description 'alias postgres sudo -u postgres psql postgres'
	sudo -u postgres psql postgres $argv;
end
