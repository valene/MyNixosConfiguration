# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the gummiboot efi boot loader.
  boot.loader.gummiboot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "wifeIsAngry"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  
  #networking.extraHosts = "127.0.0.1 wifeIsAngry.local"; 

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = with pkgs; [
  #   wget
  # ];

  # List services that you want to enable:

  #filesystem."/home" =
  #	{ device = "/dev/disk/by-uuid/45f3c5ca-e076-42b2-a227-1d26ccf8fafd";
  #	  fstype = "ext4";
  #	};

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";
  services.xserver.synaptics.enable=true;

  services.xserver.desktopManager.xfce.enable=true;
  services.xserver.windowManager.xmonad.enable=true;
  services.xserver.windowManager.xmonad.extraPackages =
 	haskellPackages: [
	haskellPackages.xmonad-contrib
				]; 
  #services.xserver.windowManager.xmonad.enableContribAndExtras=true; 
  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;
 
  services.avahi.enable=true;
  services.avahi.ipv6=true;
  services.avahi.wideArea=true; 
  services.avahi.nssmdns=true;
 
  environment.systemPackages =
  	[ pkgs.vim
	  pkgs.vlc
	  pkgs.firefox
	  pkgs.chromium
	  pkgs.mplayer
          pkgs.chromium
	  pkgs.gnome3.cheese
          pkgs.evince
          pkgs.feh
          pkgs.glxinfo
          pkgs.dmenu
          pkgs.texmaker
	  pkgs.ghc
	  pkgs.ncmpcpp
	  pkgs.ario
	  pkgs.avahi
          pkgs.xscreensaver
	  pkgs.nssmdns
	  pkgs.wget
	  pkgs.curl
	  pkgs.xcompmgr
	  pkgs.rpm
          pkgs.rxvt_unicode
          pkgs.rxvt_unicode-with-plugins
          pkgs.zlib
	]; 

 
  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.extraUsers.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";

}
