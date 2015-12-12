{
  packageOverrides = pkgs_: with pkgs_; {
    vim-custom = callPackage ./vim {};

    mine = with pkgs; buildEnv {
      name = "mine";
      paths = [
        # System
        arc-gtk-theme
        compton
        gnome3.gnome-system-monitor
        inconsolata
        networkmanagerapplet
        synapse
        taffybar
        xfce.terminal
        blueman

        # Devlopment
        cabal-install
        cabal2nix
        ctags
        # ctagsWrapped.ctagsWrapped
        # haskellPackages.hothasktags
        gitAndTools.gitFull
        haskellPackages.hdevtools
        haskellPackages.hlint
        nix-repl
        python
        vim-custom.vim

        # Office
        chromium
        evince
        gimp
        libreoffice
        lyx
        texLiveFull
      ];
    };
  };
}
