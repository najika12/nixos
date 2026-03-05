{ inputs, ... }: {
  flake.nixosModules.defaultCore = { pkgs, ... }: {

    boot = {
      loader = {
        efi = {
          efiSysMountPoint = "/boot";
          canTouchEfiVariables = true;
        };
        systemd-boot = {
          enable = true;
          configurationLimit = 10;
        };
      };
      resumeDevice = "/dev/mapper/crypted";
      kernelParams = [ "resume_offset=533760" ];
      kernelPackages = pkgs.linuxPackages_6_18;
      initrd.systemd.enable = true;
    };

    virtualisation.libvirtd.enable = true;

    networking.networkmanager.enable = true;

    time.timeZone = "Asia/Jakarta";

    i18n.defaultLocale = "en_US.UTF-8";

    nixpkgs.config.allowUnfree = false;

    environment.systemPackages = with pkgs; [
      brave
      signal-desktop
      #obsidian
      cryptomator
      ppsspp
      localsend
      fastfetch
      protonvpn-gui
      qbittorrent
      tree
      wl-clipboard
      onlyoffice-desktopeditors
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      #unrar 
      vesktop
      btop
      anki
      mullvad-browser
      gnome-boxes
      qemu
      sbctl
    ];

    networking.hostName = "rabbit";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.11";
  };
}
