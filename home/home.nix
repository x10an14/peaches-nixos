{ pkgs, username, ... }:

{
  imports = [
    ./hyprland.nix
    ./stylixTargets.nix
    ./waybar.nix
    ./fastfetch.nix
  ];
  home = {
    inherit username;
    homeDirectory = "/home/peaches";
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "nvim";
      GIT_EDITOR = "nvim";
    };

    file = {
      ".config/ghostty" = {
        source = ./config/ghostty;
        recursive = true;
      };
      ".config/starship.toml" = {
        source = ./config/starship.toml;
      };
      ".config/fastfetch/nixos.png" = {
        source = ./config/fastfetch/nixos.png;
      };
    };

    packages = with pkgs; [
      brave
      teams-for-linux
      waybar
      swww
      unzip
      tree
      vlc
      slurp
      grim
      btop
      mpv
      nil
      nixd
      proton-pass
      protonmail-desktop
      wireplumber
      nushellPlugins.polars
      chromium
      hyprshot
      feh
      sxiv
    ];
  };

  programs = {
    git.enable = true;
    git.userName = "Dont_Matta";
    git.userEmail = "204289133+peachy1775@users.noreply.github.com";
    zed-editor.enable = true;
    nushell = {
      enable = true;
      configFile.source = ./config/config.nu;
    };

    starship = {
      enable = true;
      enableNushellIntegration = true;
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      options = [ "--cmd cd" ];
    };
    nixcord = {
      enable = true;
      discord.enable = false;
      vesktop.enable = true;
      quickCss = builtins.readFile ./config/vesktop/main.css;
      config = {
        useQuickCss = true;
        themeLinks = [ ];
        frameless = true;
        plugins = {
          betterSettings.enable = true;
          callTimer.enable = true;
          crashHandler.enable = true;
          fixSpotifyEmbeds = {
            enable = true;
            volume = 9.0;
          };
          fixYoutubeEmbeds.enable = true;
          imageZoom.enable = true;
          noF1.enable = true;
          onePingPerDM.enable = true;
          openInApp.enable = true;
          quickReply.enable = true;
          spotifyControls.enable = true;
          spotifyCrack.enable = true;
          spotifyShareCommands.enable = true;
          voiceChatDoubleClick.enable = true;
          voiceDownload.enable = true;
          voiceMessages.enable = true;
          volumeBooster = {
            enable = true;
            multiplier = 5;
          };
          webKeybinds.enable = true;
          webRichPresence.enable = true;
          webScreenShareFixes.enable = true;
          youtubeAdblock.enable = true;
        };
      };
    };
  };
}
