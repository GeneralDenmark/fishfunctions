# Defined in /tmp/fish.ODtI1a/git_clip_editor.fish @ line 2
function git_clip_editor
	set stb (xclip -o)
	set sta (xclip -selection clipboard -o)
	if test -z $stb;set stb ",";end
        if test -z $sta;set sta ".";end
	if test ""$sta"" != ""$stb""
		echo "There is a michmatch between your middleclick clipboard and your primary clipboard"
		echo ""
		echo "middleclick -> " $stb
		echo "primary -> " $sta
		read -l -P "middleclick[1], primary[2] " selected
		if test $selected = 1
			set stb $sta
		else if test $selected != 2 
			echo "error in selection"
			return 1
		end
	end
	set no_space (string replace -a " " "_" -- (xclip -o))
	set no_special (string replace -a -r "(\[|\]|\(|\)|\^|\?|\+|\!|\\|\~|\:|\;|\.|\,|\||\*|\'|\"|\{|\}|\<|\>|\/|\¤|\%|\@|\'|\`|\£|\$|\½|\¾|\§|\n)" "" -- $no_space)
	set finished (string lower -- (string replace -a "å" "aa" -- (string replace -a "æ" "ae" -- (string replace -a "ø" "oe" -- $no_special))))
	echo $finished | xclip 
	echo $finished | xclip -selection clipboard
end
