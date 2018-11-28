function logo
set distro (lsb_release -d)
echo $distro
set distro (string split "Description:" -- $distro)
echo $distro[1]
echo $distro[2]
	echo '                 '(set_color F00)'___
  ___======____='(set_color FF7F00)'-'(set_color FF0)'-'(set_color FF7F00)'-='(set_color F00)')             '(set_color normal)'|
'(set_color F00)'/T            \_'(set_color FF0)'--='(set_color FF7F00)'=='(set_color F00)')            '(set_color normal)'| Powered by: FISH
'(set_color F00)'[ \ '(set_color FF7F00)'('(set_color FF0)'0'(set_color FF7F00)')   '(set_color F00)'\~    \_'(set_color FF0)'-='(set_color FF7F00)'='(set_color F00)')            '(set_color normal)'|
 '(set_color F00)'\      / )J'(set_color FF7F00)'~~    \\'(set_color FF0)'-='(set_color F00)')            '(set_color normal)'| Distro:
  '(set_color F00)'\\\\___/  )JJ'(set_color FF7F00)'~'(set_color FF0)'~~   '(set_color F00)'\)             '(set_color normal)'| Kernel: '(uname -mrs)'
   '(set_color F00)'\_____/JJJ'(set_color FF7F00)'~~'(set_color FF0)'~~    '(set_color F00)'\\            '(set_color normal)'| Memory: 
   '(set_color FF7F00)'/ '(set_color FF0)'\  '(set_color FF0)', \\'(set_color F00)'J'(set_color FF7F00)'~~~'(set_color FF0)'~~     '(set_color FF7F00)'\\           '(set_color normal)'|
  '(set_color FF7F00)'(-'(set_color FF0)'\)'(set_color F00)'\='(set_color FF7F00)'|'(set_color FF0)'\\\\\\'(set_color FF7F00)'~~'(set_color FF0)'~~       '(set_color FF7F00)'L_'(set_color FF0)'_        '(set_color normal)'|
  '(set_color FF7F00)'('(set_color F00)'\\'(set_color FF7F00)'\\)  ('(set_color FF0)'\\'(set_color FF7F00)'\\\)'(set_color F00)'_           '(set_color FF0)'\=='(set_color FF7F00)'__    '(set_color normal)'|
   '(set_color F00)'\V    '(set_color FF7F00)'\\\\'(set_color F00)'\) =='(set_color FF7F00)'=_____   '(set_color FF0)'\\\\\\\\'(set_color FF7F00)'\\\\   '(set_color normal)'|
          '(set_color F00)'\V)     \_) '(set_color FF7F00)'\\\\'(set_color FF0)'\\\\JJ\\'(set_color FF7F00)'J\)  '(set_color normal)'|
                      '(set_color F00)'/'(set_color FF7F00)'J'(set_color FF0)'\\'(set_color FF7F00)'J'(set_color F00)'T\\'(set_color FF7F00)'JJJ'(set_color F00)'J) '(set_color normal)'|
                      '(set_color F00)'(J'(set_color FF7F00)'JJ'(set_color F00)'| \UUU) '(set_color normal)'|
                       '(set_color F00)'(UU)       '(set_color normal)'|'          
end
