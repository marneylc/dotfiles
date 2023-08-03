{ config, pkgs, lib, ... }:

let
  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
in

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "marneyl";
  home.homeDirectory = "/home/marneyl";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Luke Marney";
    userEmail = "marneylc@gmail.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/keys/github_marneylc";
    };
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      plenary-nvim
      gruvbox-material
      mini-nvim
      telescope-nvim
      (fromGitHub "HEAD" "elihunter173/dirbuf.nvim")
    ];
    extraConfig = ''
      set number relativenumber
    '';
  };
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "xiong-chiamiov";
    };
    shellAliases = {
      v = "nvim";
      gh = "eval ssh-agent && ssh-add $HOME/keys/github_marneylc";
    };
  };
  programs.alacritty = {
    enable = true;
    settings = lib.attrsets.recursiveUpdate (import ~/.config/alacritty/alacritty.nix) {
      font.size = 11;
      font.user_thin_strokes = false;
      window = {
        decorations = "full"; 
      };
    };
  };
}
