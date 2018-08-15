rec {
  programs.home-manager = {
    enable = true;
    path = https://github.com/rycee/home-manager/archive/release-18.03.tar.gz;
  };


  xsession.windowManager.i3 = let
    cl  = "#a6e22e";
    fg  = "#f8f8f2";
    bg  = "#161616";
    mod = "Mod1";
  in {
    enable = true;
    config = {
      modifier = mod;
      fonts = [ "FontAwesome 8" "Terminus 8" ];

      keybindings = {
        "${mod}+Return" = "exec st";
        "${mod}+q" = "kill";

        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+f" = "fullscreen toggle";

        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";

        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5";
        "${mod}+Shift+6" = "move container to workspace 6";
        "${mod}+Shift+7" = "move container to workspace 7";
        "${mod}+Shift+8" = "move container to workspace 8";
        "${mod}+Shift+9" = "move container to workspace 9";

        "${mod}+d" = "exec dmenu_run";

      };

      colors = {
        background = bg;

        focused = {
          background = cl;
          border     = cl;
          text       = fg;
          childBorder = cl;
          indicator  = cl; 
        };

        focusedInactive = {
          background = bg;
          border     = bg;
          text       = fg;
          childBorder = bg; 
          indicator  = bg; 
        };

        placeholder = {
          background = bg;
          border     = bg;
          text       = fg;
          childBorder = bg;
          indicator   = bg;
        };

        unfocused = {
          background = bg;
          border = bg;
          text = fg;
          childBorder = bg;
          indicator = bg;
        };
        
        urgent = {
          background = cl;
          border = cl;
          text = fg;
          childBorder = cl;
          indicator = cl;
        }; 
      }; 
    };
  };
}