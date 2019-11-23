# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  term = pkgs.st.overrideAttrs (old: rec {
    
  });
  systemName = import ./system-name.nix;
in rec {
  imports =
    [ # Include the results of the hardware scan.
    
      (./. + builtins.toPath "/configs/${systemName}.nix")
    ];

  # filesystem
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  # networking
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;
  networking.networkmanager.enable = true;

  # i18n
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # time
  time.timeZone = "Europe/Moscow";

  # nixpkgs
  nixpkgs.config = {
    allowUnfree = true;
    
    st.patches = [
      (pkgs.fetchpatch {
        url = "https://st.suckless.org/patches/anysize/st-anysize-0.8.1.diff";
        sha256 = "8118dbc50d2fe07ae10958c65366476d5992684a87a431f7ee772e27d5dee50f";
      })
      (pkgs.fetchpatch {
        url = "https://st.suckless.org/patches/clipboard/st-clipboard-0.8.2.diff";
        sha256 = "7be1a09831f13361f5659aaad55110bde99b25c8ba826c11d1d7fcec21f32945";
      })
    ];
  };

  # environment
  environment.systemPackages = with pkgs; [
    wget vim firefox termite
  ];
  
  programs.nm-applet.enable = true; 

  # sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;


  # xserver
  services.xserver = {
    enable = true;
    layout = "us,ru";
    xkbOptions = "grp:win_space_toggle,grp_led:scroll,caps:swapescape";
    
    desktopManager.xterm.enable = false;

    displayManager.auto = {
      enable = true;
      user = "ki";
    };

    windowManager = {
      default = "i3";
      i3.enable = true;
      i3.configFile = pkgs.writeText "i3-config-file" (import ./i3.nix pkgs); 
    };
  };

  fonts = {
    fonts = with pkgs; [ terminus_font freefont_ttf ];
    fontconfig.defaultFonts = {
      monospace = [ "Terminus" ];
      sansSerif = [ "FreeSans" ];
      serif     = [ "FreeSerif" ];      
    };
  };

  services.compton = {
    enable = true;

    backend = "xrender";
    vSync = true; 
  };

  programs.fish.enable = true;

  # users
  users = {
    mutableUsers = false;

    users.root = {
      password = "";
      shell = pkgs.fish;
    };

    users.ki = {
      isNormalUser = true;
      password = "";
      uid = 1000;
      extraGroups = [ "networkmanager" ];
      shell = pkgs.fish;
    };
  };

  # sudo
  security.sudo = {
    enable = true;
    extraRules = [{
      groups = [ "users" ];
      commands = [{
        command = "ALL";
        options = [ "NOPASSWD" ];
      }];
    }];
  };

  # system
  system.stateVersion = "19.09"; # Did you read the comment?

}

