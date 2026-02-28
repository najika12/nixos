{ inputs, ... }: {
  flake.nixosModules.defaultCore = { pkgs, ... }: {

    boot = {
      loader = {
        grub = {
          enable = true;
          useOSProber = true;
          enableCryptodisk = true;
        };
      };
    };

    services.btrfs.autoScrub = {
      enable = true;
      interval = "weekly";
      fileSystems = ["/"];
    };

    boot.resumeDevice = "/dev/mapper/crypted";
    boot.kernelParams = [ "resume_offset=533760" ];

    boot.kernelPackages = pkgs.linuxPackages_hardened;

    boot.kernel.sysctl = {
      "kernel.unprivileged_userns_clone" = 1;
    };
    security.chromiumSuidSandbox.enable = true;

    virtualisation.libvirtd.enable = true;

    networking.networkmanager.enable = true;

    time.timeZone = "Asia/Jakarta";

    i18n.defaultLocale = "en_US.UTF-8";

    nixpkgs.config.allowUnfree = false;

    environment.systemPackages = with pkgs; [
      brave
      signal-desktop-bin
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
      haruna
      vesktop
      btop
      anki
      mullvad-browser
      gnome-boxes
      qemu
      kernel-hardening-checker
    ];

    networking.hostName = "rabbit";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.11";
  };
}
