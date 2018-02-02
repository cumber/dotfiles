self: super: {
  xmonad-custom = (
    self.haskellPackages.callPackage
      ./haskell-package/xmonad-custom.nix
      {
        powerline = self.powerlineWithGitStatus;
        inherit (self) slack;  # avoid clash with haskellPackages.slack
      }
  );
}