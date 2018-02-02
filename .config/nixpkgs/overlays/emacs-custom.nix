self: super: {
  emacs-custom = self.emacsPackagesNg.emacsWithPackages (epkgs: with epkgs; [
    use-package

    company-cabal
    intero

    php-mode

    nix-mode
    nix-sandbox

    diff-hl
    magit
    gitattributes-mode
    gitconfig-mode
    gitignore-mode

    company-flx
    fill-column-indicator
    ivy
    ivy-hydra
    linum-relative
    rainbow-delimiters
    swiper
  ]);

  # launcher script for using emacs client
  emacs-edit = super.writeShellScriptBin "ee" ''
    ${self.emacs-custom}/bin/emacsclient \
      --alternate-editor "" \
      --create-frame \
      --no-wait \
      "$@"
  '';
}