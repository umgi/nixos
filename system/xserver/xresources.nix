{ pkgs, ... }:  
let
	config = ''
 special
*.foreground:   #c5c8c6
*.background:   #1d1f21
*.cursorColor:  #c5c8c6

! black
*.color0:       #282a2e
*.color8:       #373b41

! red
*.color1:       #a54242
*.color9:       #cc6666

! green
*.color2:       #8c9440
*.color10:      #b5bd68

! yellow
*.color3:       #de935f
*.color11:      #f0c674

! blue
*.color4:       #5f819d
*.color12:      #81a2be

! magenta
*.color5:       #85678f
*.color13:      #b294bb

! cyan
*.color6:       #5e8d87
*.color14:      #8abeb7

! white
*.color7:       #707880
*.color15:      #c5c8c6

'';
in ''xrdb -override ${pkgs.writeText "xresources-file" config}''
