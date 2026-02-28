{ inputs, ... }: {

  flake.nixosModules.fail2ban = { pkgs, ... }: {
 
    # Fail2ban Configuration
    services.fail2ban = {
      enable = true;
      ignoreIP = [ "127.0.0.1/8" ];
      bantime = "60m";
      maxretry = 5;
    };  
  };
}
