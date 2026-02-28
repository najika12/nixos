{ inputs, ... }: {

  flake.nixosModules.print = { pkgs, ... }: {

    # Print Document
    services.printing.enable = true;
  };
}
