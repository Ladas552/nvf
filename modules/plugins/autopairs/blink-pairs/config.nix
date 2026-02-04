{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.nvim.dag) entryAnywhere;
  inherit (lib.nvim.lua) toLuaObject;
  cfg = config.vim.autopairs.blink-pairs;
in {
  config = mkIf cfg.enable {
    vim = {
      startPlugins = ["blink-pairs"];
      pluginRC.autopairs = entryAnywhere ''
        require('blink.pairs').setup(${toLuaObject cfg.setupOpts})
      '';
    };
  };
}
