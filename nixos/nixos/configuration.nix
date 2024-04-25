{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [
    # "nix-command"
    # "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.cudaSupport = true;

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

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # User settings
  users.users.florian = {
    isNormalUser = true;
    description = "Florian";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    packages = with pkgs; [
      ags
      blender
      btop
      brightnessctl
      discord
      eww
      hypridle
      hyprlock
      hyprpaper
      kitty
      neofetch
      pywal
      ranger
      waybar
      wofi
      wl-clipboard
      zoxide

      eslint_d
      lua-language-server
      prettierd
      stylua
      nodePackages.typescript-language-server
    ];
  };

  environment = {
    sessionVariables = {
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
    xserver.excludePackages = [ pkgs.xterm ];
    xserver.videoDrivers = [ "nvidia" ];
    xserver.displayManager.startx.enable = true;

    pipewire.enable = true;
    pipewire.alsa.enable = true;
    pipewire.alsa.support32Bit = true;
    pipewire.pulse.enable = true;
    pipewire.wireplumber.enable = true;
    pipewire.wireplumber.configPackages = [
      (pkgs.writeTextDir "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
        bluez_monitor.properties = {
          ["bluez5.enable-sbc-xq"] = true,
            ["bluez5.enable-msbc"] = true,
            ["bluez5.enable-hw-volume"] = true,
            ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
        }
      '')
    ];

    hardware.openrgb.enable = true;
  };

  programs = {
    firefox.enable = true;
    hyprland.enable = true;
    steam.enable = true;

    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  fonts.packages = with pkgs; [
    font-awesome
    powerline-fonts
    powerline-symbols
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
}
