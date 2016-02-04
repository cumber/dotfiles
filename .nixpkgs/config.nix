{
  #haskellPackageOverrides = self: super: {
  #  lushtags = self.callPackage (import ./lushtags) {};
  #};

  packageOverrides = pkgs_: with pkgs_; rec {

    vimPlugins = callPackage ./vim/plugins.nix {} pkgs_.vimPlugins;
    vim-custom = callPackage ./vim {};

    # gnome-system-monitor 3.18.0.1 doesn't have the annoying grey box bug
    gnome3 = gnome3_18;

    mine = with pkgs; buildEnv {
      name = "mine";
      paths = [
        # System
        arc-gtk-theme
        blueman
        compton
        gnome3.adwaita-icon-theme  # fallback icons from numix
        gnome3.gcr  # needed for gnome-keyring-daemon
        gnome3.gnome-system-monitor
        gnome3.gnome_keyring
        gnome3.nautilus
        gtk-engine-murrine
        inconsolata
        libnotify
        lxappearance
        networkmanagerapplet
        notify-osd
        numix-icon-theme
        synapse
        taffybar
        tree
        xfce.terminal

        # Devlopment
        cabal2nix
        colordiff
        ctags
        # ctagsWrapped.ctagsWrapped
        # haskellPackages.hothasktags
        gitAndTools.gitFull
        haskellPackages.hdevtools
        haskellPackages.hlint
        #haskellPackages.lushtags
        nix-repl
        python27Full
        vim-custom.vim

        # Office
        chromium
        evince
        gimp
        libreoffice
        speedcrunch

        # LyX / LaTeX
        lyx
        (texlive.combine {
          inherit (texlive)
            collection-latex
            collection-latexrecommended
          ;
        })
      ];
    };
  };
}
