{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  xdg.portal.enable = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # User settings
  users.users.florian = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    packages = with pkgs; [
      btop
      blender
      discord
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
      XDG_DATA_HOME = "$HOME/.cache";
      XDG_STATE_HOME = "$HOME/.local/share";
      XDG_RUNTIME_DIR = "$HOME/.local/state";
    };

    systemPackages = with pkgs; [
      git
      htop
      lshw
      pciutils
      tmux
      unzip
      vim
    ];

    plasma5.excludePackages = with pkgs.libsForQt5; [];
  };

  hardware = {
    opengl.enable = true;
  };

  sound.enable = true;
  security.rtkit.enable = true;

  services = {
    xserver.enable = true;
    xserver.displayManager.sddm.enable = true;
    xserver.desktopManager.plasma5.enable = true;

    pipewire.enable = true;
    pipewire.alsa.enable = true;
    pipewire.alsa.support32Bit = true;
    pipewire.pulse.enable = true;
    pipewire.jack.enable = true;

    hardware.openrgb.enable = true;
  };

  programs = {
    firefox.enable = true;
    steam.enable = true;
  };

  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
    powerline-symbols
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
}

