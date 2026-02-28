{ inputs, ... }: {

  flake.nixosModules.plasma = { pkgs, ... }: {

    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;
  };
}
