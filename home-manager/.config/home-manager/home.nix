{ config, pkgs, ... }:

{
  home.username = "paul";
  home.homeDirectory = "/home/paul";

  home.stateVersion = "22.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.htop
    pkgs.eza
    pkgs.delta
  ];

  programs.git = {
      enable = true;
      userName = "Paul Frische";
      userEmail = "61984114+paulfrische@users.noreply.github.com";
      delta = {
          enable = true;
      };
  };

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
  home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
  };

# You can also manage environment variables but you will have to manually
# source
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/paul/etc/profile.d/hm-session-vars.sh
#
# if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
      EDITOR = "nvim";
  };

# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
