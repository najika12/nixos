{ inputs, ... }: {

  flake.nixosModules.xserver = { pkgs, ... }: {
 
    # X11 Windowing System
    services.xserver.enable = true;
  
    # Keymap X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
