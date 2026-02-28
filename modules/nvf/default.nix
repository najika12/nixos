{ inputs, ... }: {

  flake.nixosModules.nvf = { pkgs, ... }: {
    imports = [ inputs.nvf.nixosModules.default ];

    # Nvf Configuration
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          theme = {
            enable = true;
            name = "catppuccin";
            style = "mocha";
          };
          treesitter = {
            enable = true;
          };
          languages = {
            nix = {
              enable = true;
              lsp.enable = true;
            };
          };
        };
      };
    };
  };
}
