function install_script --description "This requires fish3 to be installed and is a collection of all of AGW's dependensies"
	#### GLOBALOCAL VARIABLES ####
	set -l vers "v0.1"
	set -l desc "General purpose installation file, for installing installers installation"
	set -l help "\nWelcome to the general purpose installer for installing installations of installeres\nhere I will tell you a bit about how to use this pice of software.\n              ----------------MAIN------------------\n     -h/--help                  - Will show you this message and exit\n     -a/--author                - Will show you the author of this thingymagic\n     -v/--version               - Will show you the version of this installer\n     -y/--yes-all               - Will install everything, without prompting you for accept.. Stranger Danger!\n\nIf you can use this. Please consider buying me a coffe at some point.\n\nI live in Denmark, good luck finding me\n\nAuthor AGW"
	set -l aut "AGW"
	
	#### PARSE ARGUMENTS ####
	
	# variable initialization#
	set -l non_understood ''; set display_author false; set display_version false; set shall_exit false;
	
	# getopts parser #
	getopts $argv | while read -l key value
		switch $key
			case '_'
				echo "not supported "$value""; return 0
			case 'h' 'help'
				echo -e $help; return 0
			case 'v' 'version'
				set display_version true; set shall_exit true
			case 'a' 'author'
				set display_author true; set shall_exit true
			case '*'
				set non_understood $non_understood ' ' $key
		end
	end
	
	### opts handler ###
	if test -z non_understood
		echo -e "The following arguments are undefined:\n" $non_understood
		return 1
	end
	
	if $display_version
		printf "Version: %s\n" $vers
	end
	
	if $display_author
		printf "Author: %s\n" $aut
	end

	if $shall_exit
		return 0
	end
	
	set -l requirements https://gist.github.com/GeneralDenmark/bbb147cd493d183ef23af21c5b94fadf
	#### START SCRIPT ####
	set start_loc $PWD
	echo "Welcome to the installations script. There will be a few dialog options along the way"
	echo "you need to specify what you want to have installed and what is unness ~"
	read -P 'Press enter to confirm!'
	echo ""
	mkdir -p ~/.agw_installer/
	cd ~/.agw_installer

	

end

