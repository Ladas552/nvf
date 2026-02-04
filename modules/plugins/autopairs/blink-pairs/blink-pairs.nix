{lib, ...}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.nvim.types) mkPluginSetupOption;
in {
  options.vim.autopairs.blink-pairs = {
    enable = mkEnableOption "blink-pairs";
    setupOpts = mkPluginSetupOption "blink-pairs" {};
  };
}
