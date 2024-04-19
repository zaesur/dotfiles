{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = [ "nodev" ];
      efiSupport = true;
      enable = true;
    };
  };

  xdg.portal.enable = true;
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # User settings
  users.users.florian = {
    isNormalUser = true;
    description = "Florian";
    extraGroups = [
      "pipewire"
      "wheel"
      "networkmanager"
    ];
    packages = with pkgs; [
      btop
      # blender
      # discord
      kitty
      neofetch
      pywal
      ranger
      wofi
    ];
  };

  environment = {
    sessionVariables = {
      EDITOR = "vim";

      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_DATA_HOME = "$HOME/.local/share";
      XDG_STATE_HOME = "$HOME/.local/state";
    };

    systemPackages = with pkgs; [
      git
      htop
      lshw
      pciutils
      psmisc
      pulseaudio
      tmux
      unzip
      vim
    ];
  };

  sound.enable = true;
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;

  services = {
    xserver.enable = true;
    xserver.displayManager.startx.enable = true;

    pipewire.enable = true;
    pipewire.alsa.enable = true;
    pipewire.alsa.support32Bit = true;
    pipewire.pulse.enable = true;

    hardware.openrgb.enable = true;
  };

  programs = {
    firefox.enable = true;
    hyprland.enable = true;
    steam.enable = true;
  };

  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
    powerline-symbols
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
}
